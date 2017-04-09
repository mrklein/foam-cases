inlet_length = 1;
outlet_length = 3;

D = 1.0;
L = 2.0*D;
s0 = 0.75;

pts[] = {};
N = 100;
dx = L/N;
x = -0.5*L;

idx = newp; Point(idx) = {-inlet_length - 0.5*L, 0.5*D, 0};
idx = newp; Point(idx) = {outlet_length + 0.5*L, 0.5*D, 0};

idx = newp; Point(idx) = {-inlet_length - 0.5*L, 0, 0};
idx = newp; Point(idx) = {outlet_length + 0.5*L, 0, 0};

idx = newp; Point(idx) = {- 0.5*L, 0, 0};
idx = newp; Point(idx) = {0.5*L, 0, 0};

For i In {0:N-1}
  pts[i] = newp;
  y = 0.5*D*(1 - 0.5*s0*(1 + Cos(2*Pi*x/L)));
  Point(pts[i]) = {x, y, 0};
  x = x + dx;
EndFor

pts[N] = newp;
Point(pts[N]) = {0.5*L, 0.5*D, 0};

Line(1) = {3, 1};
Line(2) = {5, 7};
Line(3) = {6, 107};
Line(4) = {4, 2};
Line(5) = {3, 5};
Line(6) = {1, 7};
Line(7) = {6, 4};
Line(8) = {107, 2};
Line(9) = {5, 6};

Spline(newl) = pts[];

Line Loop(11) = {1, 6, -2, -5};
Plane Surface(12) = {11};
Line Loop(13) = {3, 8, -4, -7};
Plane Surface(14) = {13};
Line Loop(15) = {9, 3, -10, -2};
Ruled Surface(16) = {15};

Nradius = 50;
Ninlet = 50;
Noutlet = 150;
Nstenosis = 250;

Extrude {0, 0, 1e-2} {
  Surface{16, 12, 14};
  Layers{1};
  Recombine;
}

Transfinite Line {1:4} = Nradius + 1 Using Progression 0.95;
Transfinite Line {5, 6} = Ninlet + 1;
Transfinite Line {7, 8} = Noutlet + 1;
Transfinite Line {9, 10} = Nstenosis + 1 Using Bump 5;

Transfinite Surface "*";
Recombine Surface "*";

Physical Surface("inlet") = {47};
Physical Surface("outlet") = {77};
Physical Surface("walls") = {51, 33, 73};
Physical Surface("symmetry-plane") = {59, 25, 81};
Physical Surface("front-n-back") = {60, 12, 38, 16, 14, 82};

Physical Volume("tube") = {2, 1, 3};

