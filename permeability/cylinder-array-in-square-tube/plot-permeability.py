#!/usr/bin/env python
# -*- coding: utf-8 -*-

import matplotlib.pyplot as plt
import numpy as np

nu = 0.8926e-6

V = 7.25296131e-10
Lx = 1e-3
Ly = 1e-3
Lz = 1e-3

xi = V/(Lx*Ly*Lz)

data = np.loadtxt('postProcessing/vol-averaged-velocity/0/volFieldValue.dat',
                  converters={1: lambda s: float(s[1:]),
                              3: lambda s: float(s[:-1])})
dp = np.loadtxt('postProcessing/pressure-delta/0/fieldValueDelta.dat')

plt.figure(figsize=(8, 6))
plt.plot(data[:, 0], xi*data[:, 1]/dp[:, 1]*nu*Lx*1e12, '.-', label='Permeability')
plt.legend(loc='best')
plt.xlim(xmin=0, xmax=0.2)
plt.xlabel('Time, s')
# plt.ylim(ymin=0)
plt.ylabel('Permeability, d')
plt.grid(ls=':')

plt.savefig('permeability.pdf', bbox_inches='tight', bbox_padding=0.3)

# plt.show()
