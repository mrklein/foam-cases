// Solar pond with cuboid shape

w = 83.72;
a = 0.5*w;
h = 2.44;

n = newp; Point(n) = {0, 0, 0};

n = newp; Point(n) = {-a, -a, 0};
n = newp; Point(n) = {a, -a, 0};
n = newp; Point(n) = {a, a, 0};
n = newp; Point(n) = {-a, a, 0};

n = newp; Point(n) = {-a, 0, 0};
n = newp; Point(n) = {a, 0, 0};
n = newp; Point(n) = {0, a, 0};
n = newp; Point(n) = {0, -a, 0};

Line(1) = {1, 7};
Line(2) = {1, 6};
Line(3) = {1, 8};
Line(4) = {1, 9};
Line(5) = {9, 3};
Line(6) = {8, 4};
Line(7) = {8, 5};
Line(8) = {9, 2};
Line(9) = {6, 2};
Line(10) = {7, 3};
Line(11) = {7, 4};
Line(12) = {6, 5};

Line Loop(1) = {8, -9, -2, 4};
Plane Surface(1) = {1};
Line Loop(2) = {2, 12, -7, -3};
Plane Surface(2) = {2};
Line Loop(3) = {1, 11, -6, -3};
Plane Surface(3) = {3};
Line Loop(4) = {4, 5, -10, -1};
Plane Surface(4) = {4};

Extrude {0, 0, 2.44} {
  Surface{1}; Surface{2}; Surface{3}; Surface{4}; 
  Layers{24};
  Recombine;
}

Transfinite Line {1:12} = 20 Using Progression 0.9;
Transfinite Surface "*";
Recombine Surface "*";

Physical Surface("top") = {56, 78, 100, 34};
Physical Surface("bottom") = {51, 73, 69, 95, 91, 21, 25, 47, 2, 3, 4, 1};
Physical Volume("pond") = {3, 2, 1, 4};

