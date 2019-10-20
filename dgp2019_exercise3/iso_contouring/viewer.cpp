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
#include "viewer.h"
#include <surface_mesh/Surface_mesh.h>
#include <functional>

using std::min;
using std::max;
using namespace surface_mesh;

typedef Surface_mesh Mesh;

// ========================================================================
// NOTE : We've only included the functions you need to implement (or the
//        ones that you will need to use) in the cpp file. This is not the
//        best practice as you normaly would have all the implementation of
//        the functions here and only the declaration in the header file
//        but it allows you to have all the things you need here.
// ========================================================================

// ========================================================================
// EXERCISE 1
// ========================================================================
Scalar Viewer::iso_func_example(Point v_pos)
{
    float x,y;
    x = v_pos.x;
    y = v_pos.y;

    // ----- (un)comment a line to change the function you are testing
    //Scalar iso = sqrt(x*x + y*y) - 1;
    //Scalar iso = sin(2*x+2*y) - cos(4*x*y) +1;
    Scalar iso = y*y - sin(x*x);

    return iso;
}

std::vector<int> compute_sign(std::vector<Point> tri_pos, std::function<Scalar(Point)> iso_value)
{
    float val;
    std::vector<int> sign;


    for(auto v_pos: tri_pos){
        val = iso_value(v_pos);
        sign.push_back((val > 0) - (val < 0));
    }

    return sign;

}

Point compute_zero_point(Point pos1, Point pos2, std::function<Scalar(Point)> iso_value)
{
    Point interpolated_point(0,0,0);
    float l = std::abs(iso_value(pos1))/(std::abs(iso_value(pos1)) + std::abs(iso_value(pos2)));

    interpolated_point = (1 - l) * pos1 + l * pos2;

//    slope_tmp = (iso_value(pos2) - iso_value(pos1)) / (pos2.z - pos1.z);
//    interpolated_point.z = pos1.z - iso_value(pos1) / slope_tmp;

    return interpolated_point;
}

void Viewer::calc_iso_contouring(std::function<Scalar(Point)> iso_value)
{
    //Attention: iso_value is the input function, which take a point as an input and return its value as an output
    //to compute the function value at a given point v_pos, please use "value = iso_value(v_pos);"
    //please do not use the iso_func_example, which will be discard during the automatic testing.

    Mesh::Vertex_property<Scalar> v_iso = mesh.vertex_property<Scalar>("v:iso", 0);
    segment_points.clear();
    std::vector<Point> v_positions(mesh.n_vertices());
    std::vector<std::vector<int> > triangle_ids;

    for (auto v: mesh.vertices()) {
        Point v_pos = mesh.position(v);
        v_positions[v.idx()] = v_pos;
        Scalar iso = 0;

        iso = iso_value(v_pos);

        v_iso[v] = iso; //this variable is for coloring the density; do not change this variable
    }

    for(auto f: mesh.faces()) {
        std::vector<int> vv(3);
        int k = 0;
        for (auto v: mesh.vertices(f)) {
            vv[k] = v.idx();
            ++k;
        }
        triangle_ids.push_back(vv);
    }

    segment_points.clear();

    // Your assignment now is to implement the algorithm described in the assignment
    // sheet by filling the vector 'segment_points'

    //segment_points is defined in viewer.h as std::vector<Point> segment_points;
    //add points in segment_points forming an edge one after the other;
    //for example segment_points[0] and segment_points[1] are two points forming the first edge
    //and segment_points[2] and segment_points[3] are two points forming the second edge

    // ----- add your code here -----
    
    std::vector<Point> current_triangle(3);
    std::vector<int> current_signs(3);

    Point init_point;
    Point end_point;

    for(auto triangle_id: triangle_ids) {

        current_triangle[0] = v_positions[triangle_id[0]];
        current_triangle[1] = v_positions[triangle_id[1]];
        current_triangle[2] = v_positions[triangle_id[2]];

        current_signs = compute_sign(current_triangle, iso_value);

        if(current_signs[0] * current_signs[1] != 1) {
            
            init_point = compute_zero_point(current_triangle[0], current_triangle[1], iso_value);

            if(current_signs[1] * current_signs[2] != 1) {
                
                end_point = compute_zero_point(current_triangle[1], current_triangle[2], iso_value);

                segment_points.push_back(init_point);
                segment_points.push_back(end_point);

            }

            else if(current_signs[0] * current_signs[2] != 1) {
                
                end_point = compute_zero_point(current_triangle[0], current_triangle[2], iso_value);

                segment_points.push_back(init_point);
                segment_points.push_back(end_point);

            }

        }

        else if(current_signs[1] * current_signs[2] != 1) {
            
            init_point = compute_zero_point(current_triangle[1], current_triangle[2], iso_value);

            if(current_signs[0] * current_signs[2] != 1) {
                
                end_point = compute_zero_point(current_triangle[0], current_triangle[2], iso_value);

                segment_points.push_back(init_point);
                segment_points.push_back(end_point);

            }

        }

    }

    // ------------------------------
}
