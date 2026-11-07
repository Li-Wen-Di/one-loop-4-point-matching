# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.3.0 for Mac OS X ARM (64-bit) (July 8, 2025)
# Date: Thu 5 Nov 2026 21:55:21


from .object_library import all_couplings, Coupling

from .function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot



GC_1 = Coupling(name = 'GC_1',
                value = '-(C4*complex(0,1))',
                order = {'QED':2})

GC_2 = Coupling(name = 'GC_2',
                value = '-((C6*complex(0,1))/MH**2)',
                order = {'QED':4})

GC_3 = Coupling(name = 'GC_3',
                value = '-0.5*(CD*complex(0,1))/MH**2',
                order = {'QED':2})

