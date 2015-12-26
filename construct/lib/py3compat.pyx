from python_version cimport PY_MAJOR_VERSION
#from cpython cimport int as cint, str, bool, bytes as cbytes


if PY_MAJOR_VERSION < 3:
    import cStringIO
    StringIO = BytesIO = cStringIO.StringIO
else:
    from io import StringIO, BytesIO


int2byte = chr
byte2int = ord
bchr = lambda i: i


def u(s):
    return unicode(s, "unicode_escape")


def str2bytes(s):
    return s


def str2unicode(s):
    return unicode(s, "unicode_escape")


def bytes2str(b):
    return b


def decodebytes(b, encoding):
    return b.decode(encoding)


def advance_iterator(it):
    return next(it)
