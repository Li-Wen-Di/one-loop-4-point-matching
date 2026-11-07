"""Report and check the user-provided Python environment."""
import json, sys
import sympy
assert sys.version_info >= (3, 10), 'Python 3.10 or later is required'
print(json.dumps({'executable':sys.executable,'version':sys.version,'sympy':sympy.__version__},indent=2))
