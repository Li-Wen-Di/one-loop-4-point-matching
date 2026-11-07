# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.3.0 for Mac OS X ARM (64-bit) (July 8, 2025)
# Date: Thu 5 Nov 2026 21:55:21



from .object_library import all_particles, Particle
from . import parameters as Param
from . import propagators as Prop
phi = Particle(pdg_code = 9000001,
               name = 'phi',
               antiname = 'phi',
               spin = 1,
               color = 1,
               mass = Param.ml,
               width = Param.ZERO,
               texname = 'phi',
               antitexname = 'phi',
               charge = 0)

