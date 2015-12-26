from python_version cimport PY_MAJOR_VERSION
from cpython cimport int as cint, str, bool, bytes as cbytes


if PY_MAJOR_VERSION < 3:
    import cStringIO
    StringIO = BytesIO = cStringIO.StringIO
    bytes = str
else:
    from io import StringIO, BytesIO
    unicode = str
    bytes = bytes


bchr = lambda i: b(chr(i))


if PY_MAJOR_VERSION < 3:
    def b(s):
        return s

    def u(s):
        return unicode(s.replace(r'\\', r'\\\\'), "unicode_escape")
else:
    def b(s):
        return s.encode("latin-1")

    def u(s):
        return s


string_types = str, bytes


def byte2int(byte):
    if isinstance(byte, int):
        return byte

    return ord(b(byte))


def int2byte(cint n):
    return b(chr(n))


def str2bytes(str s):
    return b(s)


def str2unicode(str s):
    return u(s)


def bytes2str(cbytes b):
    return str(b)


def decodebytes(cbytes b, str encoding):
    return b.decode(encoding)


def advance_iterator(it):
    return next(it)
