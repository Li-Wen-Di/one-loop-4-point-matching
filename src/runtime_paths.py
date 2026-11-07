"""Resolved per-run paths supplied by the Julia launcher."""
from pathlib import Path
import os
BASE = Path(os.environ["APPENDIXA_RUNTIME"])
SOURCE = Path(os.environ["APPENDIXA_ROOT"])
