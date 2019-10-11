//=============================================================================
//
//   Code framework for the lecture
//
//   "Digital 3D Geometry Processing"
//
//   Copyright (C) 2017 by Computer Graphics and Geometry Laboratory,
//         EPF Lausanne
//
//-----------------------------------------------------------------------------
#include <nanogui/opengl.h>
#include <nanogui/glutil.h>
#include <nanogui/screen.h>
#include <nanogui/window.h>
#include <nanogui/layout.h>
#include <nanogui/popupbutton.h>
#include <nanogui/label.h>
#include <nanogui/button.h>
#include <nanogui/textbox.h>
#include <nanogui/tabwidget.h>
#include <surface_mesh/Surface_mesh.h>

#if defined(__GNUC__)
#  pragma GCC diagnostic ignored "-Wmissing-field-initializers"
#endif
#if defined(_WIN32)
#  pragma warning(push)
#  pragma warning(disable: 4457 4456 4005 4312)
#endif

#if defined(_WIN32)
#  pragma warning(pop)
#endif
#if defined(_WIN32)
#  if defined(APIENTRY)
#    undef APIENTRY
#  endif
#  include <windows.h>
#endif

using std::cout;
using std::cerr;
using std::endl;
using std::string;
using std::vector;
using std::pair;
using std::to_string;
using std::min;
using std::max;
using namespace surface_mesh;
using namespace nanogui;

class Viewer : public nanogui::Screen {
public:
    Viewer(bool _salient = false) :
    nanogui::Screen(Eigen::Vector2i(1024, 768), "DGP Viewer")
    {
        salient = _salient;

        initGUI();
        initShaders();

        loadMesh("../data/regular_mesh1.obj");
        meshProcess();
    }

    static Scalar iso_func_example(Point v_pos);
    void calc_iso_contouring(std::function<Scalar(Point)> iso_value);

    void calc_weights() {
        calc_edges_weights();
        calc_vertices_weights();
    }

    void calc_edges_weights() {
        Surface_mesh::Halfedge h0, h1, h2;
        Surface_mesh::Vertex v0, v1;
        Point p0, p1, p2, d0, d1;
        Scalar w;
        auto eweight = mesh.edge_property<Scalar>("e:weight", 0);
        for (auto e: mesh.edges()) {
            w = 0.0;

            h0 = mesh.halfedge(e, 0);
            v0 = mesh.to_vertex(h0);
            p0 = mesh.position(v0);

            h1 = mesh.halfedge(e, 1);
            v1 = mesh.to_vertex(h1);
            p1 = mesh.position(v1);

            h2 = mesh.next_halfedge(h0);
            p2 = mesh.position(mesh.to_vertex(h2));
            d0 = normalize(p0 - p2);
            d1 = normalize(p1 - p2);
            w += 1.0 / tan(acos(min(0.99f, max(-0.99f, dot(d0, d1)))));

            h2 = mesh.next_halfedge(h1);
            p2 = mesh.position(mesh.to_vertex(h2));
            d0 = normalize(p0 - p2);
            d1 = normalize(p1 - p2);
            w += 1.0 / tan(acos(min(0.99f, max(-0.99f, dot(d0, d1)))));

            w = max(0.0f, w);
            eweight[e] = w * 0.5;
        }
    }

    void calc_vertices_weights() {
        Surface_mesh::Face_around_vertex_circulator vf_c, vf_end;
        Surface_mesh::Vertex_around_face_circulator fv_c;
        Scalar area;
        auto vweight = mesh.vertex_property<Scalar>("v:weight", 0);

        for (auto v: mesh.vertices()) {
            area = 0.0;
            vf_c = mesh.faces(v);

            if(!vf_c) {
                continue;
            }

            vf_end = vf_c;

            do {
                fv_c = mesh.vertices(*vf_c);

                const Point& P = mesh.position(*fv_c);  ++fv_c;
                const Point& Q = mesh.position(*fv_c);  ++fv_c;
                const Point& R = mesh.position(*fv_c);

                area += norm(cross(Q-P, R-P)) * 0.5f * 0.3333f;

            } while(++vf_c != vf_end);

            vweight[v] = 0.5 / area;
        }
    }

    void loadMesh(string filename) {
        if (!mesh.read(filename)) {
            std::cerr << "Mesh not found, exiting." << std::endl;
            exit(-1);
        }

        if(!salient) cout << "Mesh "<< filename << " loaded." << endl;
        n_vertices = mesh.n_vertices();
        if(!salient) cout << "# of vertices : " << n_vertices << endl;
        n_faces = mesh.n_faces();
        if(!salient) cout << "# of faces : " << n_faces << endl;
        n_edges = mesh.n_edges();
        if(!salient) cout << "# of edges : " << n_edges << endl;

        mesh_center = computeCenter(&mesh);
        float dist_max = 0.0f;
        for (auto v: mesh.vertices()) {
            if ( distance(mesh_center, mesh.position(v))> dist_max) {
                dist_max = distance(mesh_center, mesh.position(v));
            }
        }

        mCamera.arcball = Arcball();
        mCamera.arcball.setSize(mSize);
        mCamera.modelZoom = 2/dist_max;
        mCamera.modelTranslation = -Vector3f(mesh_center.x, mesh_center.y, mesh_center.z);
    }

    void meshProcess() {
        Point default_normal(0.0, 1.0, 0.0);
        Surface_mesh::Vertex_property<Point> vertex_normal =
                mesh.vertex_property<Point>("v:normal");
        mesh.update_face_normals();
        mesh.update_vertex_normals();
        v_color_iso = mesh.vertex_property<surface_mesh::Color>("v:color_iso",
                                        surface_mesh::Color(1.0f, 1.0f, 1.0f));

        auto v_iso = mesh.vertex_property<Scalar>("v:iso", 0);

        calc_weights();
        calc_iso_contouring(iso_func_example);

        /*calc_iso_contouring([](Point p) -> Scalar{
            return p[0] * p[1];
        });*/

        color_coding(v_iso, &mesh, v_color_iso);

        int j = 0;
        MatrixXf mesh_points(3, n_vertices);
        MatrixXu indices(3, n_faces);

        for(auto f: mesh.faces()) {
            vector<float> vv(3.0f);
            int k = 0;
            for (auto v: mesh.vertices(f)) {
                vv[k] = v.idx();
                ++k;
            }
            indices.col(j) << vv[0], vv[1], vv[2];
            ++j;
        }

        // Create big matrices to send the data to the GPU with the required
        // format
        MatrixXf color_iso_attrib(3, n_vertices);

        j = 0;
        for (auto v: mesh.vertices()) {
            mesh_points.col(j) << mesh.position(v).x,
                                  mesh.position(v).y,
                                  mesh.position(v).z;

            color_iso_attrib.col(j) << v_color_iso[v].x,
                                                v_color_iso[v].y,
                                                v_color_iso[v].z;
            ++j;
        }

        mShader.bind();
        mShader.uploadIndices(indices);
        mShader.uploadAttrib("position", mesh_points);
        mShader.uploadAttrib("iso_color", color_iso_attrib);
        mShader.setUniform("color_mode", int(color_mode));
        mShader.setUniform("intensity", Vector3f(0.98, 0.59, 0.04));


        MatrixXf seg_points(3, segment_points.size());
        for(j=0;j<segment_points.size();j++)
            seg_points.col(j) << segment_points[j].x,
                                 segment_points[j].y,
                                 segment_points[j].z + 0.0001;


        mShaderNormals.bind();
        mShaderNormals.uploadAttrib("position", seg_points);
    }

    void initGUI() {
        window = new Window(this, "Controls");
        window->setPosition(Vector2i(15, 15));
        window->setLayout(new GroupLayout());

        PopupButton *popupBtn = new PopupButton(window, "Open a mesh", ENTYPO_ICON_EXPORT);
        Popup *popup = popupBtn->popup();
        popup->setLayout(new GroupLayout());

        Button* b = new Button(popup, "Regular Mesh 1");
        b->setCallback([this]() {
            loadMesh("../data/regular_mesh1.obj");
            meshProcess();
        });
        b = new Button(popup, "Regular Mesh 2");
        b->setCallback([this]() {
            loadMesh("../data/regular_mesh2.obj");
            meshProcess();
        });
        b = new Button(popup, "Regular Mesh 3");
        b->setCallback([this]() {
            loadMesh("../data/regular_mesh3.obj");
            meshProcess();
        });

        b = new Button(popup, "Mesh 4");
        b->setCallback([this]() {
            loadMesh("../data/mesh4.obj");
            meshProcess();
        });

        b = new Button(popup, "Mesh 5");
        b->setCallback([this]() {
            loadMesh("../data/mesh5.obj");
            meshProcess();
        });

        b = new Button(popup, "Mesh 6");
        b->setCallback([this]() {
            loadMesh("../data/mesh6.obj");
            meshProcess();
        });

        new Label(window, "Display Control", "sans-bold");

        b = new Button(window, "Wireframe");
        b->setFlags(Button::ToggleButton);
        b->setChangeCallback([this](bool wireframe) {
            this->wireframe =! this->wireframe;
        });

        b = new Button(window, "Level Set");
        b->setFlags(Button::ToggleButton);
        b->setChangeCallback([this](bool iso_curve) {
            this->iso_curve =! this->iso_curve;
        });

        b = new Button(window, "Density");
        b->setFlags(Button::ToggleButton);
        b->setChangeCallback([this](bool iso) {
            if (iso) {
                this->color_mode = ISO;
            } else {
                this->color_mode = NORMAL;
            }
        });

        Widget* panel = new Widget(popup);
        panel->setLayout(new GroupLayout());

        panel = new Widget(popup);
        GridLayout *layout = new GridLayout(Orientation::Horizontal, 2,
                                            Alignment::Middle, 15, 5);
        layout->setColAlignment({ Alignment::Maximum, Alignment::Fill });
        layout->setSpacing(0, 10);
        panel->setLayout(layout);

        performLayout();
    }

    void initShaders() {
        // Shaders
        mShader.init(
            "a_simple_shader",

            /* Vertex shader */
            "#version 330\n"
            "uniform mat4 MV;\n"
            "uniform mat4 P;\n"
            "uniform int color_mode;\n"
            "uniform vec3 intensity;\n"

            "in vec3 position;\n"
            "in vec3 iso_color;\n"
            "in vec3 normal;\n"

            "out vec3 fcolor;\n"
            "out vec3 fnormal;\n"
            "out vec3 view_dir;\n"
            "out vec3 light_dir;\n"

            "void main() {\n"
            "    vec4 vpoint_mv = MV * vec4(position, 1.0);\n"
            "    gl_Position = P * vpoint_mv;\n"
            "    if (color_mode == 1) {\n"
            "        fcolor = iso_color;\n"
            "    } else {\n"
            "        fcolor = intensity;\n"
            "    }\n"
            "    fnormal = mat3(transpose(inverse(MV))) * normal;\n"
            "    light_dir = vec3(0.0, 3.0, 3.0) - vpoint_mv.xyz;\n"
            "    view_dir = -vpoint_mv.xyz;\n"
            "}",

            /* Fragment shader */
            "#version 330\n"
            "uniform int color_mode;\n"
            "uniform vec3 intensity;\n"

            "in vec3 fcolor;\n"
            "in vec3 fnormal;\n"
            "in vec3 view_dir;\n"
            "in vec3 light_dir;\n"

            "out vec4 color;\n"

            "void main() {\n"
            "    vec3 c = vec3(0.0);\n"
            "    if (color_mode == 0) {\n"
            "        c += vec3(1.0)*vec3(0.18, 0.1, 0.1);\n"
            "        vec3 n = normalize(fnormal);\n"
            "        vec3 v = normalize(view_dir);\n"
            "        vec3 l = normalize(light_dir);\n"
            "        float lambert = dot(n,l);\n"
            "        if(lambert > 0.0) {\n"
            "            c += vec3(1.0)*vec3(0.9, 0.5, 0.5)*lambert;\n"
            "            vec3 v = normalize(view_dir);\n"
            "            vec3 r = reflect(-l,n);\n"
            "            c += vec3(1.0)*vec3(0.8, 0.8, 0.8)*pow(max(dot(r,v), 0.0), 90.0);\n"
            "        }\n"
            "        c *= fcolor;\n"
            "    } else {\n"
            "       c = fcolor;\n"
            "    }\n"
            "    if (intensity == vec3(0.0)) {\n"
            "        c = intensity;\n"
            "    }\n"
            "    color = vec4(c, 1.0);\n"
            "}"
        );

        mShaderNormals.init(
            "normal_shader",
            /* Vertex shader */

            "#version 330\n\n"
            "in vec3 position;\n"
            "uniform mat4 MV;\n"
            "uniform mat4 P;\n"
            "void main() {\n"
            "  gl_Position = P*MV*vec4(position, 1.0);\n"
            "}",
            /* Fragment shader */
            "#version 330\n\n"
            "out vec4 frag_color;\n"
            "void main() {\n"
            "   frag_color = vec4(1.0, 1.0, 1.0, 0.0);\n"
            "}"
        );

    }

    void color_coding(Surface_mesh::Vertex_property<Scalar> prop, Surface_mesh *mesh,
            Surface_mesh::Vertex_property<surface_mesh::Color> color_prop, int bound = 20) {
        // Get the value array
        std::vector<Scalar> values = prop.vector();

        // discard upper and lower bound
	    unsigned int n = values.size()-1;
	    unsigned int i = n / bound;
	    std::sort(values.begin(), values.end());
        Scalar min_value = values[i], max_value = values[n-1-i];

        // map values to colors
	    for (auto v: mesh->vertices())
	    {
            set_color(v, value_to_color(prop[v], min_value, max_value), color_prop);
	    }
    }

    void set_color(Surface_mesh::Vertex v, const surface_mesh::Color& col,
                   Surface_mesh::Vertex_property<surface_mesh::Color> color_prop)
    {
        color_prop[v] = col;
    }

    surface_mesh::Color value_to_color(Scalar value, Scalar min_value, Scalar max_value) {
        Scalar v0, v1, v2, v3, v4;
        v0 = min_value + 0.0/4.0 * (max_value - min_value);
        v1 = min_value + 1.0/4.0 * (max_value - min_value);
        v2 = min_value + 2.0/4.0 * (max_value - min_value);
        v3 = min_value + 3.0/4.0 * (max_value - min_value);
        v4 = min_value + 4.0/4.0 * (max_value - min_value);

        surface_mesh::Color col(1.0f, 1.0f, 1.0f);

        if (value < v0) {
            col = surface_mesh::Color(0, 0, 1);
        } else if (value > v4) {
            col = surface_mesh::Color(1, 0, 0);
        } else if (value <= v2) {
		    if (value <= v1) { // [v0, v1]
                Scalar u =  (value - v0) / (v1 - v0);
                col = surface_mesh::Color(0, u, 1);
		    } else { // ]v1, v2]
                Scalar u = (value - v1) / (v2 - v1);
                col = surface_mesh::Color(0, 1, 1-u);
		    }
	    } else {
		    if (value <= v3) { // ]v2, v3]
                Scalar u = (value - v2) / (v3 - v2);
                col = surface_mesh::Color(u, 1, 0);
		    } else { // ]v3, v4]
                Scalar u = (value - v3) / (v4 - v3);
                col = surface_mesh::Color(1, 1-u, 0);
		    }
	    }
	    return col;
    }

    ~Viewer() {
        mShader.free();
        mShaderNormals.free();
    }

    Point computeCenter(Surface_mesh *mesh) {
        Point center = Point(0.0f);

        for (auto v: mesh->vertices()) {
            center += mesh->position(v);
        }

        return center/mesh->n_vertices();
    }

    virtual bool keyboardEvent(int key, int scancode, int action, int modifiers) {
        if (Screen::keyboardEvent(key, scancode, action, modifiers)) {
            return true;
        }
        if (key == GLFW_KEY_ESCAPE && action == GLFW_PRESS) {
            setVisible(false);
            return true;
        }
        return false;
    }

    virtual void draw(NVGcontext *ctx) {
        /* Draw the user interface */
        Screen::draw(ctx);
    }

    Vector2f getScreenCoord() {
        Vector2i pos = mousePos();
        return Vector2f(2.0f * (float)pos.x() / width() - 1.0f,
                        1.0f - 2.0f * (float)pos.y() / height());
    }

    void repaint() {
        //glfwPostEmptyEvent();
    }

    virtual void drawContents() {
        using namespace nanogui;

        /* Draw the window contents using OpenGL */
        mShader.bind();

        Eigen::Matrix4f model, view, proj;
        computeCameraMatrices(model, view, proj);

        Matrix4f mv = view*model;
        Matrix4f p = proj;

        /* MVP uniforms */
        mShader.setUniform("MV", mv);
        mShader.setUniform("P", p);

        /* Setup OpenGL (making sure the GUI doesn't disable these */
        glEnable(GL_DEPTH_TEST);
        glDisable(GL_CULL_FACE);

        /* Render everything */
        if (wireframe) {
            glEnable(GL_POLYGON_OFFSET_FILL);
            glPolygonOffset(1.0, 1.0);
            glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
        }

        Vector3f colors(0.98, 0.59, 0.04);
        mShader.setUniform("intensity", colors);
        if (color_mode == ISO) {
            mShader.setUniform("color_mode", int(color_mode));
        }
        mShader.drawIndexed(GL_TRIANGLES, 0, n_faces);

        if (wireframe) {
            glDisable(GL_POLYGON_OFFSET_FILL);
            glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
            colors << 0.0, 0.0, 0.0;
            mShader.setUniform("intensity", colors);
            mShader.drawIndexed(GL_TRIANGLES, 0, n_faces);
            glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
        }

        if(iso_curve)
        {
            glEnable(GL_LINE_SMOOTH);
            glLineWidth(2.0);
            mShaderNormals.bind();
            mShaderNormals.setUniform("MV", mv);
            mShaderNormals.setUniform("P", p);
            mShaderNormals.drawArray(GL_LINES,0,segment_points.size());
            glDisable(GL_LINE_SMOOTH);
        }
    }

    bool scrollEvent(const Vector2i &p, const Vector2f &rel) {
        if (!Screen::scrollEvent(p, rel)) {
            mCamera.zoom = max(0.1, mCamera.zoom * (rel.y() > 0 ? 1.1 : 0.9));
            repaint();
        }
        return true;
    }

    void reset() {
        // reset all the components
        // recenter the mesh (maybe keep the original mesh somewhere so that if
        // we modify - smooth or else - it we can restore the original one.)
    }

    bool mouseMotionEvent(const Vector2i &p, const Vector2i &rel,
                          int button, int modifiers) {
        if (!Screen::mouseMotionEvent(p, rel, button, modifiers)) {
            if (mCamera.arcball.motion(p)) {
                repaint();
            } else if (mTranslate) {
                Eigen::Matrix4f model, view, proj;
                computeCameraMatrices(model, view, proj);
                float zval = nanogui::project(Vector3f(mesh_center.x,
                                                       mesh_center.y,
                                                       mesh_center.z),
                                              view * model, proj, mSize).z();
                Eigen::Vector3f pos1 = nanogui::unproject(
                        Eigen::Vector3f(p.x(), mSize.y() - p.y(), zval), view * model, proj, mSize);
                Eigen::Vector3f pos0 = nanogui::unproject(
                        Eigen::Vector3f(mTranslateStart.x(), mSize.y() -
                           mTranslateStart.y(), zval), view * model, proj, mSize);
                mCamera.modelTranslation = mCamera.modelTranslation_start + (pos1-pos0);
                repaint();
            }
        }
        return true;
    }

    bool mouseButtonEvent(const Vector2i &p, int button, bool down, int modifiers) {
        if (!Screen::mouseButtonEvent(p, button, down, modifiers)) {
            if (button == GLFW_MOUSE_BUTTON_1 && modifiers == 0) {
                mCamera.arcball.button(p, down);
            } else if (button == GLFW_MOUSE_BUTTON_2 ||
                  (button == GLFW_MOUSE_BUTTON_1 && modifiers == GLFW_MOD_SHIFT)) {
                mCamera.modelTranslation_start = mCamera.modelTranslation;
                mTranslate = true;
                mTranslateStart = p;
            }
        }
        if (button == GLFW_MOUSE_BUTTON_1 && !down) {
            mCamera.arcball.button(p, false);
        }
        if (!down) {
            mDrag = false;
            mTranslate = false;
        }
        return true;
    }

private:
    struct CameraParameters {
        nanogui::Arcball arcball;
        float zoom = 1.0f, viewAngle = 45.0f;
        float dnear = 0.05f, dfar = 100.0f;
        Eigen::Vector3f eye = Eigen::Vector3f(0.0f, 0.0f, 5.0f);
        Eigen::Vector3f center = Eigen::Vector3f(0.0f, 0.0f, 0.0f);
        Eigen::Vector3f up = Eigen::Vector3f(0.0f, 1.0f, 0.0f);
        Eigen::Vector3f modelTranslation = Eigen::Vector3f::Zero();
        Eigen::Vector3f modelTranslation_start = Eigen::Vector3f::Zero();
        float modelZoom = 1.0f;
    };

    CameraParameters mCamera;
    bool mTranslate = false;
    bool mDrag = false;
    Vector2i mTranslateStart = Vector2i(0,0);

    void computeCameraMatrices(Eigen::Matrix4f &model,
                               Eigen::Matrix4f &view,
                               Eigen::Matrix4f &proj) {

        view = nanogui::lookAt(mCamera.eye, mCamera.center, mCamera.up);

        float fH = std::tan(mCamera.viewAngle / 360.0f * M_PI) * mCamera.dnear;
        float fW = fH * (float) mSize.x() / (float) mSize.y();

        proj = nanogui::frustum(-fW, fW, -fH, fH, mCamera.dnear, mCamera.dfar);
        model = mCamera.arcball.matrix();

        model = nanogui::scale(model, Eigen::Vector3f::Constant(mCamera.zoom * mCamera.modelZoom));
        model = nanogui::translate(model, mCamera.modelTranslation);
    }

public:
    // Variables for the viewer
    nanogui::GLShader mShader; // Mesh rendering
    nanogui::GLShader mShaderNormals; // Iso contours
    nanogui::Window *window;
    nanogui::Arcball arcball;

    Point mesh_center = Point(0.0f, 0.0f, 0.0f);
    Surface_mesh::Vertex_property<surface_mesh::Color> v_color_iso;
    Surface_mesh mesh;

    enum COLOR_MODE : int { NORMAL = 0, ISO = 1};

    // Boolean for the viewer
    bool wireframe = false;
    bool iso_curve = false;
    bool normals = false;

    std::vector<Point> segment_points;

    COLOR_MODE color_mode = NORMAL;

    PopupButton *popupCurvature;
    FloatBox<float>* coefTextBox;
    IntBox<int>* iterationTextBox;

    // Mesh informations
    int n_vertices = 0;
    int n_faces = 0;
    int n_edges = 0;

    bool salient;
};
