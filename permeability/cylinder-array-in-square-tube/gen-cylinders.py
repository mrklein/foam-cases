#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function

# Diameter of a tube
D = 1e-3

# Generate NxN array of cylinders
N = 4

dl = 0.5*D/N

# x-coordinate shift of cylinder area
shift = 0.5e-3

cyl_desc = """
cylv{0:d}
{{
  type searchableCylinder;
  point1 ({1:f} {2:f} -1);
  point2 ({1:f} {2:f} 1);
  radius {3:f};
}}

cylh{0:d}
{{
  type searchableCylinder;
  point1 ({1:f} -1 {2:f});
  point2 ({1:f} 1 {2:f});
  radius {3:f};
}}
"""

with open('cylinders', 'w') as f:
    cnt = 1
    xc = shift + dl
    for i in range(N):
        yc = dl
        for j in range(N):
            print(cyl_desc.format(cnt, xc, yc, 0.5*dl), file=f)
            yc += 2.0*dl
            cnt += 1
        xc += 2.0*dl
