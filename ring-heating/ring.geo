wedge_alpha = 2.5*Pi/180;

Rinner = 1;
Router = 1.5;
width = 0.5;

Point(0) = {0, -Rinner, 0};
Point(1) = {width, -Rinner, 0};
Point(2) = {width, -Router, 0};
Point(3) = {0, -Router, 0};
Line(1) = {3, 2};
Line(2) = {0, 1};
Line(3) = {2, 1};
Line(4) = {3, 0};
Line Loop(5) = {4, 2, -3, -1};
Plane Surface(6) = {5};
Rotate {{1, 0, 0}, {0, 0, 0}, -wedge_alpha} {
  Surface{6};
}
Extrude {{1, 0, 0}, {0, 0, 0}, 2*wedge_alpha} {
  Surface{6};
  Layers{1};
  Recombine;
}

Transfinite Line {1:4} = 101 Using Bump 0.5;
Transfinite Surface "*";
Recombine Surface "*";

Physical Surface("inner-wall") = {19};
Physical Surface("outer-wall") = {27};
Physical Surface("left-wall") = {15};
Physical Surface("right-wall") = {23};
Physical Surface("w1") = {6};
Physical Surface("w2") = {28};
Physical Volume("sector") = {1};
