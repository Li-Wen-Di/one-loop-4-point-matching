# This file was automatically created by FeynRules 2.3.49
# Mathematica version: 14.3.0 for Mac OS X ARM (64-bit) (July 8, 2025)
# Date: Thu 5 Nov 2026 21:55:21



from .object_library import all_parameters, Parameter


from .function_library import complexconjugate, re, im, csc, sec, acsc, asec, cot

# This is a default parameter object representing 0.
ZERO = Parameter(name = 'ZERO',
                 nature = 'internal',
                 type = 'real',
                 value = '0.0',
                 texname = '0')

# User-defined parameters.
MH = Parameter(name = 'MH',
               nature = 'external',
               type = 'real',
               value = 10,
               texname = '\\text{MH}',
               lhablock = 'FRBlock',
               lhacode = [ 1 ])

C4 = Parameter(name = 'C4',
               nature = 'external',
               type = 'real',
               value = -0.07,
               texname = '\\text{C4}',
               lhablock = 'FRBlock',
               lhacode = [ 2 ])

CD = Parameter(name = 'CD',
               nature = 'external',
               type = 'real',
               value = 0.36,
               texname = '\\text{CD}',
               lhablock = 'FRBlock',
               lhacode = [ 3 ])

C6 = Parameter(name = 'C6',
               nature = 'external',
               type = 'real',
               value = 1.62,
               texname = '\\text{C6}',
               lhablock = 'FRBlock',
               lhacode = [ 4 ])

ml = Parameter(name = 'ml',
               nature = 'external',
               type = 'real',
               value = 1,
               texname = '\\text{ml}',
               lhablock = 'MASS',
               lhacode = [ 9000001 ])

