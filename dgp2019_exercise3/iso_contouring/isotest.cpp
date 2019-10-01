//
// Created by ziqwang on 2019-09-27.
//

#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include "catch2/catch.hpp"
#include "viewer.h"


//computing the difference between the two curves.
double contour_distance(vector<Point> user, vector<float> _answer){
    vector<Point> answer(_answer.size() / 2);
    for(int id = 0; id < _answer.size() / 2; id++){
        answer[id] = Point(_answer[id * 2], _answer[id * 2 + 1], 0);
    }

    float dist = 0;

    //for each point in the user, we find the closest point in the answer and store their distance.
    for(Point pu : user){
        float pair_min_dist = 1 << 30;
        for(Point pa : answer )
        {
            pair_min_dist = std::min(pair_min_dist, norm(pa - pu));
        }
        dist = std::max(dist, pair_min_dist);
    }

    //for each point in the answer, we find the closest point in the user and store their distance.
    for(Point pu : answer){
        float pair_min_dist = 1 << 30;
        for(Point pa : user)
        {
            pair_min_dist = std::min(pair_min_dist, norm(pa - pu));
        }
        dist = std::max(dist, pair_min_dist);
    }

    return dist;
}

void print_users(vector<Point> users){
    std::cout << "{";
    for(int id = 0; id < users.size(); id++){
        std::cout << users[id][0] << ", " << users[id][1] << ", ";
    }
    std::cout << "};\n";
}

TEST_CASE( "test case for mesh 1", "mesh1" ) {

    //Loading the mesh.
    nanogui::init();
    nanogui::ref<Viewer> app = new Viewer(true);
    app->loadMesh("../data/regular_mesh1.obj");

    //Check whether the loaded mesh is correct.
    SECTION("load mesh"){
        REQUIRE(app->mesh.n_vertices() == 110);
        REQUIRE(app->mesh.n_faces() == 180);
    }

    //Test the function y*y - sin(x*x)
    SECTION("y*y - sin(x*x)"){
        std::function<Scalar(Point)> iso_func = [](Point v_pos){
            float x,y;
            x = v_pos.x;
            y = v_pos.y;
            Scalar iso = y*y - sin(x*x);
            return iso;
        };
        app->calc_iso_contouring(iso_func);
        vector<float> correct_pts = {-1.41149, -0.88593, -1.59724, -0.519615, -1.41149, -0.88593, -0.999068, -0.867639, -0.656354, -0.617223, -0.999068, -0.867639, -0.656354, -0.617223, -0.576984, -0.55948, -0.576984, -0.55948, -0.459869, -0.519615, 0.576984, -0.55948, 0.459869, -0.519615, 0.576984, -0.55948, 0.656354, -0.617223, 0.999068, -0.867639, 0.656354, -0.617223, 0.999068, -0.867639, 1.41149, -0.88593, 1.41149, -0.88593, 1.59724, -0.519615, 2.8869, -0.715504, 2.90648, -0.519615, -2.54299, -0.271954, -2.41825, -2.22045e-16, -1.70363, -0.352692, -1.76943, -2.22045e-16, -1.59724, -0.519615, -1.70363, -0.352692, -0.459869, -0.519615, -0.225076, -0.129772, 0.225076, -0.129772, -0.225076, -0.129772, 0.459869, -0.519615, 0.225076, -0.129772, 1.59724, -0.519615, 1.70363, -0.352692, 1.70363, -0.352692, 1.76943, -2.22045e-16, 2.54299, -0.271954, 2.41825, -2.22045e-16, 2.90648, -0.519615, 2.54299, -0.271954, -2.41825, -2.22045e-16, -2.54299, 0.271954, -1.76943, -2.22045e-16, -1.70363, 0.352692, -1.70363, 0.352692, -1.59724, 0.519615, -0.225076, 0.129772, -0.459869, 0.519615, -0.225076, 0.129772, 0.225076, 0.129772, 0.225076, 0.129772, 0.459869, 0.519615, 1.70363, 0.352692, 1.59724, 0.519615, 1.76943, -2.22045e-16, 1.70363, 0.352692, 2.41825, -2.22045e-16, 2.54299, 0.271954, 2.54299, 0.271954, 2.90648, 0.519615, -1.59724, 0.519615, -1.41149, 0.88593, -0.999068, 0.867639, -1.41149, 0.88593, -0.999068, 0.867639, -0.656354, 0.617223, -0.576984, 0.55948, -0.656354, 0.617223, -0.459869, 0.519615, -0.576984, 0.55948, 0.459869, 0.519615, 0.576984, 0.55948, 0.656354, 0.617223, 0.576984, 0.55948, 0.656354, 0.617223, 0.999068, 0.867639, 1.41149, 0.88593, 0.999068, 0.867639, 1.59724, 0.519615, 1.41149, 0.88593, 2.90648, 0.519615, 2.8869, 0.715504, };
        REQUIRE(contour_distance(app->segment_points, correct_pts) < 1e-3);
    }

    //Test the function y*x - exp(x*x) + log(std::abs(x + y))
    SECTION("y*x - exp(x*x) + log(std::abs(x + y))"){
        std::function<Scalar(Point)> iso_func = [](Point v_pos){
            float x,y;
            x = v_pos.x;
            y = v_pos.y;
            Scalar iso = y*x - exp(x*x) + log(std::abs(x + y));
            return iso;
        };
        app->calc_iso_contouring(iso_func);
        vector<float> correct_pts = {0.145563, 2.07846, 0.0307638, 2.5448, -1.20708, -2.59808, -1.21304, -2.5755, -1.21304, -2.5755, -0.973756, -2.07846, -0.0203528, -2.59808, -0.0307638, -2.5448, -0.0307638, -2.5448, -0.145563, -2.07846, -0.973756, -2.07846, -1.00454, -1.8974, -1.00454, -1.8974, -0.701402, -1.55885, -0.175251, -1.86239, -0.403127, -1.55885, -0.145563, -2.07846, -0.175251, -1.86239, -0.701402, -1.55885, -0.688372, -1.40578, -0.493069, -1.37364, -0.688372, -1.40578, -0.403127, -1.55885, -0.493069, -1.37364, 1.21304, 2.5755, 1.20708, 2.59808, 0.973756, 2.07846, 1.21304, 2.5755, 0.493069, 1.37364, 0.403127, 1.55885, 0.493069, 1.37364, 0.688372, 1.40578, 0.688372, 1.40578, 0.701402, 1.55885, 0.175251, 1.86239, 0.145563, 2.07846, 0.403127, 1.55885, 0.175251, 1.86239, 0.701402, 1.55885, 1.00454, 1.8974, 1.00454, 1.8974, 0.973756, 2.07846, 0.0307638, 2.5448, 0.0203528, 2.59808, };
        REQUIRE(contour_distance(app->segment_points, correct_pts) < 1e-3);
    }
    nanogui::shutdown();
}
