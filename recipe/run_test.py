import os
import sys
import ctypes

version = os.getenv("PKG_VERSION")
vstring = '_'.join(version.split('.')[:2])

if sys.platform == 'win32':
    lib = ctypes.CDLL('xerces-c_%s.dll' % vstring)
elif sys.platform == 'darwin':
    # LD_LIBRARY_PATH not set on OSX or Linux
    path = os.path.expandvars('$PREFIX/lib/libxerces-c.dylib')
    lib = ctypes.CDLL(path)
else:
    path = os.path.expandvars('$PREFIX/lib/libxerces-c.so')
    lib = ctypes.CDLL(path)
