L = 2;
H = 0.45;

h_injection = 0.01;

a = 0.5*(H - h_injection);
b = 0.5*(H + h_injection);

// Number of cells
N_injection = 5;

dx = h_injection/N_injection;

// Number of cells
// Along air inlets
N1 = a/dx;
// Along injector
N2 = h_injection/dx;
// Along channel
N3 = 0.25*L/dx;

p = newp; Point(p) = {0, 0, 0};
p = newp; Point(p) = {0, a, 0};
p = newp; Point(p) = {0, b, 0};
p = newp; Point(p) = {0, H, 0};

p = newp; Point(p) = {L, 0, 0};
p = newp; Point(p) = {L, a, 0};
p = newp; Point(p) = {L, b, 0};
p = newp; Point(p) = {L, H, 0};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {5, 6};
Line(5) = {6, 7};
Line(6) = {7, 8};
Line(7) = {1, 5};
Line(8) = {4, 8};
Line(9) = {3, 7};
Line(10) = {2, 6};

Line Loop(1) = {3, 8, -6, -9};
Plane Surface(1) = {1};
Line Loop(2) = {10, 5, -9, -2};
Plane Surface(2) = {2};
Line Loop(3) = {4, -10, -1, 7};
Plane Surface(3) = {3};

Transfinite Line {1, 3, 4, 6} = N1 + 1;
Transfinite Line {2, 5} = N2 + 1;
Transfinite Line {7:10} = N3 + 1;

Extrude {0, 0, h_injection} {
  Surface{1:3};
  Layers{1};
  Recombine;
}

Transfinite Surface "*";
Recombine Surface "*";

Physical Surface("injector") = {53};
Physical Surface("inlet") = {19, 71};
Physical Surface("outlet") = {27, 45, 63};
Physical Surface("walls") = {75, 23};

Physical Volume(5) = {2, 3, 1};
