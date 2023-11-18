#!/usr/bin/env python

from setuptools import setup

setup(
    name='pybay2023-python',
    version='0.1.0',
    py_modules=['hello'],
    entry_points={
        'console_scripts': ['pybay = hello:main']
    },
)
