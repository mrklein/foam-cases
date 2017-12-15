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

dP = 10
L = 10e-3

k = 56.91

# Q = dP / L * np.pi / (2*k) * (D**4) / mu
# Uin = Q / A

Uin = dP/L*(2*D*l)/(k*mu)
Q = Uin*A

print 'Flow rate = %e m3/s' % Q
print 'Inlet velocity = %e m/s' % Uin

Re = Uin * D / nu

print 'Re = %e' % Re

data = np.loadtxt('postProcessing/vol-averaged-velocity/0/volFieldValue.dat',
                  converters={1: lambda s: float(s[1:]),
                              3: lambda s: float(s[:-1])})

plt.figure(figsize=(8, 6))
plt.plot(data[:, 0], data[:, 1], '.-', label='Simulation')
plt.plot(data[:, 0], Uin + data[:, 1]*0, '-', label='Darcy-Weisbach')
plt.legend(loc='best')
plt.xlim(xmin=0)
plt.xlabel('Time, s')
plt.ylim(ymin=0)
plt.ylabel('Inlet velocity, m/s')
plt.grid(ls=':')

plt.savefig('inlet-velocity.pdf', bbox_inches='tight', bbox_padding=0.3)

# plt.show()
