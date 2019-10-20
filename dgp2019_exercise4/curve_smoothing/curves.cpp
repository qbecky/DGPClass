#include <OpenGP/GL/TrackballWindow.h>
#include <OpenGP/SurfaceMesh/GL/SurfaceMeshRenderShaded.h>
#include <OpenGP/SurfaceMesh/GL/SurfaceMeshRenderFlat.h>
#include <OpenGP/GL/PointsRenderer.h>
#include <OpenGP/GL/SegmentsRenderer.h>
#include <random>

using namespace OpenGP;

struct MainWindow : public TrackballWindow {
    PointsRenderer render_points = PointsRenderer ();
    SegmentsRenderer render_segments = SegmentsRenderer ();

    MatMxN points;
    MatMxN points_3d_render;
    int num_points;
    double radius = 0.3;
    SegmentsRenderer::Segments segments;

    // ============================================================================
    // Exercise 2 : fill the 2 functions below (see PDF for instructions)
    // To test your implementation, use the S key for laplacian smoothing and the
    // C key for the osculating circle.
    // Before you hand in your code, make sure that you pass the test, by running
    // the smoothing_test executable.
    // ============================================================================

    void laplacianSmoothing(double epsilon) {
        // Modify the positions of the vertices by manipulating the matrix
        // "points", which is a 2 x n matrix (n is the number of vertices)
        // where each column contains the x,y positions of a point.

        
        
    }

    void osculatingCircle(double epsilon) {
        // Modify the positions of the vertices by manipulating the matrix
        // "points", which is a 2 x n matrix (n is the number of vertices)
        // where each column contains the x,y positions of a point.

        
    }

    // ============================================================================
    // END OF Exercise 2 (do not thouch the rest of the code)
    // ============================================================================

    void generateRandomizedClosedPolyline() {
        std::default_random_engine generator;
        generator.seed(std::default_random_engine::default_seed);
        std::uniform_real_distribution<double> distribution(0., 5*3e-2);

        Vec2 center(3e-2, 2e-3);

        points = MatMxN::Zero(2, num_points);
        for (int i = 0; i < num_points; ++i)
        {
            double frac = static_cast<double>(i) / static_cast<double>(num_points);
            points(0, i) = center(0) + radius * cos (2. * M_PI * frac) + distribution(generator);
            points(1, i) = center(1) + radius * sin (2. * M_PI * frac) + distribution(generator);
        }

    }

    void render () {

        // Prepare the render points
        points_3d_render = MatMxN::Zero(3, points.cols());
        points_3d_render.block(0, 0, 2, points.cols()) = points;

        // Rebuild the segments
        segments.clear();
        for (int i = 0; i < points_3d_render.cols(); ++i) {
            segments.push_back({ points_3d_render.col(i), points_3d_render.col((i+1) % points_3d_render.cols()) });
        }
        render_points.init_data(points_3d_render);
        render_segments.init_data(segments);
    }

    MainWindow(int argc, char** argv) : TrackballWindow("2D Viewer", 640, 480) {
        num_points = 30;

        points = MatMxN::Zero(2, num_points);
        points << 0.349731 , 0.356288 , 0.444268 , 0.277891 , 0.231894 , 0.283016 , 0.201744 , 0.166537 , 0.00576114 , 0.0507565 , 0.0273825 , -0.159836 , -0.147243 , -0.202828 , -0.128796 , -0.194322 , -0.189348 , -0.233001 , -0.0756325 , -0.163227 , -0.101195 , 0.0317264 , 0.131927 , 0.13835 , 0.248932 , 0.250188 , 0.316487 , 0.347477 , 0.437674 , 0.355357 , 0.0707975 , 0.166203 , 0.201933 , 0.257791 , 0.23497 , 0.401373 , 0.385405 , 0.414686 , 0.349592 , 0.342118 , 0.374811 , 0.35765 , 0.249995 , 0.148997 , 0.0734582 , 0.0498549 , -0.0467636 , -0.0623997 , -0.104669 , -0.105413 , -0.154539 , -0.174505 , -0.250408 , -0.169459 , -0.221008 , -0.231058 , -0.215985 , -0.0620917 , 0.00628495 , -0.0408094;

        this->scene.add(render_points);
        this->scene.add(render_segments);

        render();
    }

    bool key_callback(int key, int scancode, int action, int mods) override {
        TrackballWindow::key_callback(key, scancode, action, mods);
        if (key == GLFW_KEY_S && action == GLFW_RELEASE)
        {
            laplacianSmoothing(0.1);
        }
        else if (key == GLFW_KEY_C && action == GLFW_RELEASE)
        {
            osculatingCircle(0.001);
        }
        else if (key == GLFW_KEY_1 && action == GLFW_RELEASE)
        {
            num_points = 30;
            radius = 0.3;
            generateRandomizedClosedPolyline();
        }
        else if (key == GLFW_KEY_2 && action == GLFW_RELEASE)
        {
            num_points = 50;
            radius = 0.1;
            generateRandomizedClosedPolyline();
        }
        else if (key == GLFW_KEY_3 && action == GLFW_RELEASE)
        {
            num_points = 100;
            radius = 0.1;
            generateRandomizedClosedPolyline();
        }
        else if (key == GLFW_KEY_4 && action == GLFW_RELEASE)
        {
            num_points = 150;
            radius = 0.1;
            generateRandomizedClosedPolyline();
        }

        render();
        return true;
    }
};


#ifndef SMOOTHING_TEST
int main(int argc, char** argv)
{
    MainWindow window(argc, argv);
    return window.run();
}
#endif
