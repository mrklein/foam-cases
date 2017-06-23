// Tube radii
Router = 0.0125; // [m]
Rinner = 0.0095;  // [m]

// Tube length
H = 0.55; // [m]

// Mesh density of different cylinder parts (number of cells + 1)
NH = 5; // number of points along the tube
ND = 5;  // number of points along radius
NR = 11;  // number of points along the edge of tube

Point(1)  = { 0,      0,  0};
Point(18) = { 0,      H,  0};

Point(2)  = { Router, 0,  0};
Point(3)  = { 0,      0,  Router};
Point(4)  = {-Router, 0,  0};
Point(5)  = { 0,      0, -Router};

Point(6)  = { Rinner, 0,  0};
Point(7)  = { 0,      0,  Rinner};
Point(8)  = {-Rinner, 0,  0};
Point(9)  = { 0,      0, -Rinner};

Point(10) = { Router, H,  0};
Point(11) = { 0,      H,  Router};
Point(12) = {-Router, H,  0};
Point(13) = { 0,      H, -Router};

Point(14) = { Rinner, H,  0};
Point(15) = { 0,      H,  Rinner};
Point(16) = {-Rinner, H,  0};
Point(17) = { 0,      H, -Rinner};

Circle(1) = {2,1,3};
Circle(2) = {3,1,4};
Circle(3) = {4,1,5};
Circle(4) = {5,1,2};

Circle(5) = {6,1,7};
Circle(6) = {7,1,8};
Circle(7) = {8,1,9};
Circle(8) = {9,1,6};

Circle(9) = {10,18,11};
Circle(10) = {11,18,12};
Circle(11) = {12,18,13};
Circle(12) = {13,18,10};

Circle(13) = {14,18,15};
Circle(14) = {15,18,16};
Circle(15) = {16,18,17};
Circle(16) = {17,18,14};

Line(17) = {14, 10};
Line(18) = {17, 13};
Line(19) = {16, 12};
Line(20) = {15, 11};
Line(21) = {5, 9};
Line(22) = {7, 3};
Line(23) = {4, 8};
Line(24) = {6, 2};
Line(25) = {5, 13};
Line(26) = {9, 17};
Line(27) = {8, 16};
Line(28) = {4, 12};
Line(29) = {3, 11};
Line(30) = {7, 15};
Line(31) = {6, 14};
Line(32) = {2, 10};
Line Loop(33) = {6, -23, -2, -22};
Ruled Surface(34) = {33};
Line Loop(35) = {5, 22, -1, -24};
Ruled Surface(36) = {35};
Line Loop(37) = {24, -4, 21, 8};
Ruled Surface(38) = {37};
Line Loop(39) = {7, -21, -3, 23};
Ruled Surface(40) = {39};
Line Loop(41) = {19, 11, -18, -15};
Ruled Surface(42) = {41};
Line Loop(43) = {19, -10, -20, 14};
Ruled Surface(44) = {43};
Line Loop(45) = {20, -9, -17, 13};
Ruled Surface(46) = {45};
Line Loop(47) = {17, -12, -18, 16};
Ruled Surface(48) = {47};
Line Loop(49) = {6, 27, -14, -30};
Ruled Surface(50) = {49};
Line Loop(51) = {13, -30, -5, 31};
Ruled Surface(52) = {51};
Line Loop(53) = {8, 31, -16, -26};
Ruled Surface(54) = {53};
Line Loop(55) = {7, 26, -15, -27};
Ruled Surface(56) = {55};
Line Loop(57) = {24, 32, -17, -31};
Plane Surface(58) = {57};
Line Loop(59) = {21, 26, 18, -25};
Plane Surface(60) = {59};
Line Loop(61) = {27, 19, -28, 23};
Plane Surface(62) = {61};
Line Loop(63) = {22, 29, -20, -30};
Plane Surface(64) = {63};
Line Loop(65) = {10, -28, -2, 29};
Ruled Surface(66) = {65};
Line Loop(67) = {1, 29, -9, -32};
Ruled Surface(68) = {67};
Line Loop(69) = {4, 32, -12, -25};
Ruled Surface(70) = {69};
Line Loop(71) = {28, 11, -25, -3};
Ruled Surface(72) = {71};
Surface Loop(73) = {36, 52, 46, 68, 64, 58};
Volume(74) = {73};
Surface Loop(75) = {38, 70, 48, 54, 58, 60};
Volume(76) = {75};
Surface Loop(77) = {40, 56, 42, 72, 60, 62};
Volume(78) = {77};
Surface Loop(79) = {34, 50, 44, 66, 64, 62};
Volume(80) = {79};

Physical Surface("bottom") = {34, 40, 38, 36};
Physical Surface("top") = {44, 42, 48, 46};
// Physical Surface("inner-wall") = {52, 54, 56, 50};
// Physical Surface("outer-wall") = {70, 68, 66, 72};
Physical Volume("tube") = {74, 80, 78, 76};

Transfinite Line {29, 28, 25, 32, 27, 30, 26, 31} = NH;
Transfinite Line {22, 24, 21, 23, 20, 19, 18, 17} = ND;
Transfinite Line {5, 6, 7, 8, 13, 14, 15, 16} = NR;
Transfinite Line {1, 2, 3, 4, 9, 10, 11, 12} = NR;

Transfinite Surface "*";
Recombine Surface "*";

Transfinite Volume "*";

Mesh 3;

// Uncomment the last line to save generated mesh upon opening the file with gmsh
// Or you can do "gmsh - cylinder.geo" to avoid starting GUI
// Save "tube.msh";

