#!/usr/bin/env gnuplot

d = '< sed "s%(\(.*\))%\1%" postProcessing/vol-averaged-velocity/0/volFieldValue.dat'

rho = 1000
nu = 0.8926e-6
mu = rho*nu
dP = 10
L = 2e-3

set xlabel 'Time, s'
set ylabel 'Permeability, d'
set grid

plot d using 1:($2/dP*mu*L*1e12) with linespoints lw 2 pointtype 7 pointsize 1 notitle
pause -1

# vi: set ft=gnuplot:
