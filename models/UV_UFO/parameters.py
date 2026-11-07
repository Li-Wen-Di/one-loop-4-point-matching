# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.3.0 for Mac OS X ARM (64-bit) (July 8, 2025)
# Date: Thu 5 Nov 2026 21:55:20



from .object_library import all_parameters, Parameter


from .function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot

# This is a default parameter object representing 0.
ZERO = Parameter(name = 'ZERO',
                 nature = 'internal',
                 type = 'real',
                 value = '0.0',
                 texname = '0')

# User-defined parameters.
lam0 = Parameter(name = 'lam0',
                 nature = 'external',
                 type = 'real',
                 value = 0.2,
                 texname = '\\text{lam0}',
                 lhablock = 'FRBlock',
                 lhacode = [ 1 ])

lam1 = Parameter(name = 'lam1',
                 nature = 'external',
                 type = 'real',
                 value = 0.3,
                 texname = '\\text{lam1}',
                 lhablock = 'FRBlock',
                 lhacode = [ 2 ])

lam2 = Parameter(name = 'lam2',
                 nature = 'external',
                 type = 'real',
                 value = 0.4,
                 texname = '\\text{lam2}',
                 lhablock = 'FRBlock',
                 lhacode = [ 3 ])

ml = Parameter(name = 'ml',
               nature = 'external',
               type = 'real',
               value = 1,
               texname = '\\text{ml}',
               lhablock = 'MASS',
               lhacode = [ 9000001 ])

MH = Parameter(name = 'MH',
               nature = 'external',
               type = 'real',
               value = 10,
               texname = '\\text{MH}',
               lhablock = 'MASS',
               lhacode = [ 9000002 ])

