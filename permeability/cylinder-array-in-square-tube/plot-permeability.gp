#!/usr/bin/env gnuplot

# Since both function objects has the same write interval, we can join them
# into file with time, dP, Ux, Uy, Uz columns
d = '< join -j 1 postProcessing/pressure-delta/0/fieldValueDelta.dat postProcessing/vol-averaged-velocity/0/volFieldValue.dat | sed "s%(\(.*\))%\1%"'

nu = 0.8926e-6

# Length, width, and height of porous zone
Lx = 1e-3
Ly = 1e-3
Lz = 1e-3

# V_zone value is taken from volFieldValue.dat and is calculated by function
# object, V_zone_real is calculated as Lx*Ly*Lz
V_zone = 7.25296131e-10
V_zone_real = Lx*Ly*Lz
xi = V_zone/V_zone_real

set xlabel 'Time, s'
set ylabel 'Permeability, d'
set grid

plot d using 1:(xi*$3/$2*nu*Lx*1e12) with linespoints lw 2 pointtype 7 pointsize 1 notitle
pause -1

# vi: set ft=gnuplot:
