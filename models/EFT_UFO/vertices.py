# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.3.0 for Mac OS X ARM (64-bit) (July 8, 2025)
# Date: Thu 5 Nov 2026 21:55:21


from .object_library import all_vertices, Vertex
from . import particles as P
from . import couplings as C
from . import lorentz as L
V_1 = Vertex(name = 'V_1',
             particles = [ P.phi, P.phi, P.phi, P.phi ],
             color = [ '1' ],
             lorentz = [ L.SSSS1, L.SSSS2 ],
             couplings = {(0,0):C.GC_1,(0,1):C.GC_3})

V_2 = Vertex(name = 'V_2',
             particles = [ P.phi, P.phi, P.phi, P.phi, P.phi, P.phi ],
             color = [ '1' ],
             lorentz = [ L.SSSSSS1 ],
             couplings = {(0,0):C.GC_2})

