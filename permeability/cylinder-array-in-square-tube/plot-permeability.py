#!/usr/bin/env python
# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
import numpy as np

# Tube with square profile
l = 1e-3
A = l * l

rho = 1000
nu = 0.8926e-6
mu = rho * nu

dP = 10
L = 2e-3

data = np.loadtxt('postProcessing/vol-averaged-velocity/0/volFieldValue.dat',
                  converters={1: lambda s: float(s[1:]),
                              3: lambda s: float(s[:-1])})

plt.figure(figsize=(8, 6))
plt.plot(data[:, 0], data[:, 1]/dP*mu*L*1e12, '.-', label='Permeability')
plt.legend(loc='best')
plt.xlim(xmin=0, xmax=0.2)
plt.xlabel('Time, s')
plt.ylim(ymin=0)
plt.ylabel('Permeability, d')
plt.grid(ls=':')

plt.savefig('permeability.pdf', bbox_inches='tight', bbox_padding=0.3)

#plt.show()
