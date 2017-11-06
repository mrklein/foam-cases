// Solar pond of cylindrical shape

R = 47.2;
h = 2.44;

dr = 1.0;
dh = 0.1;

C = Cos(120.0*Pi/180.0);

a = R;
b = R/Sqrt(2.0);
c = 0.5*R;
d = 0.5*R/Sqrt(2.0);
e = 0.25*R;
f = 0.125*R*(C - Sqrt(1.0 - C*C) - 1.0)/(C - 1.0);

Ninner = e/dr;
Nouter1 = (c - e)/dr;
Nouter2 = (a - c)/dr;

idx = newp; Point(idx) = { 0,  0, 0};
idx = newp; Point(idx) = { a,  0, 0};
idx = newp; Point(idx) = { b,  b, 0};
idx = newp; Point(idx) = { 0,  a, 0};
idx = newp; Point(idx) = {-b,  b, 0};
idx = newp; Point(idx) = {-a,  0, 0};
idx = newp; Point(idx) = {-b, -b, 0};
idx = newp; Point(idx) = { 0, -a, 0};
idx = newp; Point(idx) = { b, -b, 0};

idx = newp; Point(idx) = { c,  0, 0};
idx = newp; Point(idx) = { d,  d, 0};
idx = newp; Point(idx) = { 0,  c, 0};
idx = newp; Point(idx) = {-d,  d, 0};
idx = newp; Point(idx) = {-c,  0, 0};
idx = newp; Point(idx) = {-d, -d, 0};
idx = newp; Point(idx) = { 0, -c, 0};
idx = newp; Point(idx) = { d, -d, 0};

idx = newp; Point(idx) = { e,  0, 0};
idx = newp; Point(idx) = { f,  f, 0};
idx = newp; Point(idx) = { 0,  e, 0};
idx = newp; Point(idx) = {-f,  f, 0};
idx = newp; Point(idx) = {-e,  0, 0};
idx = newp; Point(idx) = {-f, -f, 0};
idx = newp; Point(idx) = { 0, -e, 0};
idx = newp; Point(idx) = { f, -f, 0};

Line(1) = {1, 18};
Line(2) = {1, 22};
Line(3) = {1, 20};
Line(4) = {1, 24};
Line(5) = {24, 25};
Line(6) = {25, 18};
Line(7) = {18, 19};
Line(8) = {19, 20};
Line(9) = {20, 21};
Line(10) = {21, 22};
Line(11) = {22, 23};
Line(12) = {23, 24};

Circle(13) = {10, 1, 11};
Circle(14) = {11, 1, 12};
Circle(15) = {12, 1, 13};
Circle(16) = {13, 1, 14};
Circle(17) = {14, 1, 15};
Circle(18) = {15, 1, 16};
Circle(19) = {16, 1, 17};
Circle(20) = {17, 1, 10};
Circle(21) = {2, 1, 3};
Circle(22) = {3, 1, 4};
Circle(23) = {4, 1, 5};
Circle(24) = {5, 1, 6};
Circle(25) = {6, 1, 7};
Circle(26) = {7, 1, 8};
Circle(27) = {8, 1, 9};
Circle(28) = {9, 1, 2};

Line(29) = {18, 10};
Line(30) = {19, 11};
Line(31) = {20, 12};
Line(32) = {21, 13};
Line(33) = {22, 14};
Line(34) = {23, 15};
Line(35) = {24, 16};
Line(36) = {25, 17};
Line(37) = {10, 2};
Line(38) = {11, 3};
Line(39) = {12, 4};
Line(40) = {13, 5};
Line(41) = {14, 6};
Line(42) = {15, 7};
Line(43) = {16, 8};
Line(44) = {17, 9};

Line Loop(1) = {1, 7, 8, -3};
Surface(1) = {1};
Line Loop(2) = {3, 9, 10, -2};
Surface(2) = {2};
Line Loop(3) = {2, 11, 12, -4};
Surface(3) = {3};
Line Loop(4) = {4, 5, 6, -1};
Surface(4) = {4};
Line Loop(5) = {20, -29, -6, 36};
Surface(5) = {5};
Line Loop(6) = {29, 13, -30, -7};
Surface(6) = {6};
Line Loop(7) = {30, 14, -31, -8};
Surface(7) = {7};
Line Loop(8) = {31, 15, -32, -9};
Surface(8) = {8};
Line Loop(9) = {32, 16, -33, -10};
Surface(9) = {9};
Line Loop(10) = {17, -34, -11, 33};
Surface(10) = {10};
Line Loop(11) = {34, 18, -35, -12};
Surface(11) = {11};
Line Loop(12) = {35, 19, -36, -5};
Surface(12) = {12};
Line Loop(13) = {37, 21, -38, -13};
Surface(13) = {13};
Line Loop(14) = {38, 22, -39, -14};
Surface(14) = {14};
Line Loop(15) = {39, 23, -40, -15};
Surface(15) = {15};
Line Loop(16) = {40, 24, -41, -16};
Surface(16) = {16};
Line Loop(17) = {25, -42, -17, 41};
Surface(17) = {17};
Line Loop(18) = {26, -43, -18, 42};
Surface(18) = {18};
Line Loop(19) = {27, -44, -19, 43};
Surface(19) = {19};
Line Loop(20) = {28, -37, -20, 44};
Surface(20) = {20};

Transfinite Line {1:28} = Ninner + 1;
Transfinite Line {29:36} = Nouter1 + 1;
Transfinite Line {37:44} = Nouter2 + 1;

Transfinite Surface "*";
Recombine Surface "*";

Extrude {0, 0, h} {
  Surface{1:20};
  Layers{h/dh};
  Recombine;
}

Physical Surface("top") = {396, 352, 374, 330, 484, 462, 440, 418, 264, 242, 220, 198, 176, 154, 308, 286, 110, 88, 132, 66};
Physical Surface("bottom") = {1, 4, 3, 2, 7, 6, 5, 12, 11, 10, 9, 8, 13, 20, 19, 18, 17, 16, 15, 14, 321:387:22, 405:471:22};
Physical Volume("pond") = {1:20};

