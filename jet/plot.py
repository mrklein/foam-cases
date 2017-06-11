#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
import os
import sys
import numpy as np
import matplotlib.pyplot as plt

DATA_PATH = 'postProcessing/center-plane'


def _load_data(time, fields=['U', 'p', 'nut']):
    print('Loading data ... ', end='')
    sys.stdout.flush()
    files = {'U': None, 'p': None, 'nut': None}
    if time == 'latest':
        # Find latest time
        data_time = str(max(map(float, os.listdir(DATA_PATH))))
    else:
        # Check if time exists
        if not os.path.exists(os.path.join(DATA_PATH, time)):
            raise OSError('Time {} does not exist'.format(time))
        data_time = time
    for k, _ in files.items():
        if k not in fields:
            continue
        file_path = os.path.join(DATA_PATH, data_time,
                                 '{}_center-plane.raw'.format(k))
        if not os.path.exists(file_path):
            continue
        files[k] = np.loadtxt(file_path)
    print('Done.')
    sys.stdout.flush()
    return data_time, files['U'], files['p'], files['nut']


def _plot_velocity(t, vel):
    if vel is None:
        return
    print('Plotting velocity ... ', end='')
    sys.stdout.flush()
    x = vel[:, 0]
    y = vel[:, 1]
    Ux = vel[:, 3]
    Uy = vel[:, 4]
    Umag = np.sqrt(Ux * Ux + Uy * Uy)
    plt.figure()
    plt.viridis()
    plt.tricontourf(x, y, Umag, 64)
    plt.gca().set_aspect('equal')
    plt.colorbar(orientation='horizontal')
    plt.xlabel('x, m')
    plt.ylabel('y, m')
    plt.title('Velocity magnitude, t = {} s'.format(t))
    print('Done.')
    sys.stdout.flush()
    plt.savefig('velocity.png', bbox_inches='tight', bbox_padding=0.5, dpi=150)


def _plot_nut(t, nut):
    if nut is None:
        return
    print('Plotting nut ... ', end='')
    sys.stdout.flush()
    x = nut[:, 0]
    y = nut[:, 1]
    nut = nut[:, 3]
    plt.figure()
    plt.viridis()
    plt.tricontourf(x, y, nut / 15.11e-6, 64)
    plt.gca().set_aspect('equal')
    plt.colorbar(orientation='horizontal')
    plt.xlabel('x, m')
    plt.ylabel('y, m')
    plt.title(r'$\nu_t/\nu,\ t = {}\ s$'.format(t))
    print('Done.')
    sys.stdout.flush()
    plt.savefig('nut.png', bbox_inches='tight', bbox_padding=0.5, dpi=150)


def _plot():
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument('--fields', nargs='+', default=['U', 'p', 'nut'])
    parser.add_argument('--time', nargs=1, default=['latest'])
    args = vars(parser.parse_args())
    t, U, p, nut = _load_data(args['time'].pop(), args['fields'])

    if 'U' in args['fields']:
        _plot_velocity(t, U)
    if 'nut' in args['fields']:
        _plot_nut(t, nut)


if __name__ == '__main__':
    _plot()
