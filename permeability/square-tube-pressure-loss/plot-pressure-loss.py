#!/usr/bin/env python
# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
import numpy as np

# Tube with square profile
l = 1e-3

A = l * l
P = 4 * l
D = 4 * A / P

print 'Hydraulic diameter = %e' % D

rho = 1000
nu = 0.8926e-6
mu = rho * nu

L = 10e-3

k = 56.91
Uin = 1e-2
Q = Uin*A

dP = 0.5*L*k*mu*Uin/l/D

print 'Flow rate = %e m3/s' % Q
print 'Inlet velocity = %e m/s' % Uin
print 'Pressure loss = %e Pa' % dP

Re = Uin * D / nu

print 'Re = %e' % Re

data = np.loadtxt('postProcessing/surface-average-pressure/0/surfaceFieldValue.dat')

plt.figure(figsize=(8, 6))
plt.plot(data[:, 0], data[:, 1]*rho, '.-', label='Simulation')
plt.plot(data[:, 0], dP + data[:, 1]*0, '-', label='Darcy-Weisbach')
plt.legend(loc='best')
plt.xlim(xmin=0, xmax=1)
plt.xlabel('Time, s')
plt.ylim(ymin=2, ymax=5)
plt.ylabel('Pressure loss, Pa')
plt.grid(ls=':')

plt.savefig('pressure-loss.pdf', bbox_inches='tight', bbox_padding=0.3)

# plt.show()
