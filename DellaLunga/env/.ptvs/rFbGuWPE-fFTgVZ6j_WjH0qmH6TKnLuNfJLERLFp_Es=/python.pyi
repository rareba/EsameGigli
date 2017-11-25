import exceptions
class __Unknown:
    '<unknown type>'
class __NoneType:
    'the type of the None object'
class object:
    'The most base type'
    __class__ = object
    def __delattr__(self):
        "x.__delattr__('name') <==> del x.name"
        pass
    def __format__(self, format_spec):
        'default object formatter'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __reduce__(self):
        'helper for pickle'
        pass
    def __reduce_ex__(self, protocol):
        'helper for pickle'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setattr__(self):
        "x.__setattr__('name', value) <==> x.name = value"
        pass
    def __sizeof__():
        '__sizeof__() -> size of object in memory, in bytes'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
__Object = object
class type(object):
    "type(object) -> the object's type\ntype(name, bases, dict) -> a new type"
    __abstractmethods__ = getset_descriptor()
    __base__ = object()
    __bases__ = ()
    __basicsize__ = 872
    def __call__(self):
        'x.__call__(...) <==> x(...)'
        pass
    __class__ = type
    def __delattr__(self):
        "x.__delattr__('name') <==> del x.name"
        pass
    __dict__ = {}
    __dictoffset__ = 264
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    __flags__ = -2146544149
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __instancecheck__():
        '__instancecheck__() -> check if an object is an instance'
        pass
    __itemsize__ = 40
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    __module__ = '__builtin__'
    __mro__ = ()
    __name__ = 'type'
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setattr__(self):
        "x.__setattr__('name', value) <==> x.name = value"
        pass
    def __subclasscheck__(cls, subclass):
        '__subclasschck__ -> check if an class is a subclass'
        pass
    def __subclasses__():
        '__subclasses__() -> list of immediate subclasses'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    __weakrefoffset__ = 368
    def mro():
        "mro() -> list\nreturn a type's method resolution order"
        pass
__Type = type
class int(object):
    'int(x[, base]) -> integer\n\nConvert a string or number to an integer, if possible.  A floating point\nargument will be truncated towards zero (this does not include a string\nrepresentation of a floating point number!)  When converting a string, use\nthe optional base.  It is an error to supply a base when converting a\nnon-string.  If base is zero, the proper base is guessed based on the\nstring content.  If the argument is outside the integer range a\nlong object will be returned instead.'
    def __abs__(self):
        'x.__abs__() <==> abs(x)'
        pass
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    def __and__(self):
        'x.__and__(y) <==> x&y'
        pass
    __class__ = int
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __coerce__(self):
        'x.__coerce__(y) <==> coerce(x, y)'
        pass
    def __div__(self):
        'x.__div__(y) <==> x/y'
        pass
    def __divmod__(self):
        'x.__divmod__(y) <==> divmod(x, y)'
        pass
    def __float__(self):
        'x.__float__() <==> float(x)'
        pass
    def __floordiv__(self):
        'x.__floordiv__(y) <==> x//y'
        pass
    def __format__(self, format_spec):
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getnewargs__(self):
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __hex__(self):
        'x.__hex__() <==> hex(x)'
        pass
    def __index__(self):
        'x[y:z] <==> x[y.__index__():z.__index__()]'
        pass
    def __int__(self):
        'x.__int__() <==> int(x)'
        pass
    def __invert__(self):
        'x.__invert__() <==> ~x'
        pass
    def __long__(self):
        'x.__long__() <==> long(x)'
        pass
    def __lshift__(self):
        'x.__lshift__(y) <==> x<<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(y) <==> x*y'
        pass
    def __neg__(self):
        'x.__neg__() <==> -x'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __nonzero__(self):
        'x.__nonzero__() <==> x != 0'
        pass
    def __oct__(self):
        'x.__oct__() <==> oct(x)'
        pass
    def __or__(self):
        'x.__or__(y) <==> x|y'
        pass
    def __pos__(self):
        'x.__pos__() <==> +x'
        pass
    def __pow__(self):
        'x.__pow__(y[, z]) <==> pow(x, y[, z])'
        pass
    def __radd__(self):
        'x.__radd__(y) <==> y+x'
        pass
    def __rand__(self):
        'x.__rand__(y) <==> y&x'
        pass
    def __rdiv__(self):
        'x.__rdiv__(y) <==> y/x'
        pass
    def __rdivmod__(self):
        'x.__rdivmod__(y) <==> divmod(y, x)'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rfloordiv__(self):
        'x.__rfloordiv__(y) <==> y//x'
        pass
    def __rlshift__(self):
        'x.__rlshift__(y) <==> y<<x'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(y) <==> y*x'
        pass
    def __ror__(self):
        'x.__ror__(y) <==> y|x'
        pass
    def __rpow__(self):
        'y.__rpow__(x[, z]) <==> pow(x, y[, z])'
        pass
    def __rrshift__(self):
        'x.__rrshift__(y) <==> y>>x'
        pass
    def __rshift__(self):
        'x.__rshift__(y) <==> x>>y'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rtruediv__(self):
        'x.__rtruediv__(y) <==> y/x'
        pass
    def __rxor__(self):
        'x.__rxor__(y) <==> y^x'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __truediv__(self):
        'x.__truediv__(y) <==> x/y'
        pass
    def __trunc__(self):
        'Truncating an Integral returns itself.'
        pass
    def __xor__(self):
        'x.__xor__(y) <==> x^y'
        pass
    def bit_length(self):
        "int.bit_length() -> int\n\nNumber of bits necessary to represent self in binary.\n>>> bin(37)\n'0b100101'\n>>> (37).bit_length()\n6"
        pass
    def conjugate(self):
        'Returns self, the complex conjugate of any int.'
        pass
    denominator = getset_descriptor()
    imag = getset_descriptor()
    numerator = getset_descriptor()
    real = getset_descriptor()
__Int = int
class bool(int):
    'bool(x) -> bool\n\nReturns True when the argument x is true, False otherwise.\nThe builtins True and False are the only two instances of the class bool.\nThe class bool is a subclass of the class int, and cannot be subclassed.'
    def __and__(self):
        'x.__and__(y) <==> x&y'
        pass
    __class__ = bool
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __or__(self):
        'x.__or__(y) <==> x|y'
        pass
    def __rand__(self):
        'x.__rand__(y) <==> y&x'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __ror__(self):
        'x.__ror__(y) <==> y|x'
        pass
    def __rxor__(self):
        'x.__rxor__(y) <==> y^x'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __xor__(self):
        'x.__xor__(y) <==> x^y'
        pass
__Bool = bool
class long(object):
    'long(x[, base]) -> integer\n\nConvert a string or number to a long integer, if possible.  A floating\npoint argument will be truncated towards zero (this does not include a\nstring representation of a floating point number!)  When converting a\nstring, use the optional base.  It is an error to supply a base when\nconverting a non-string.'
    def __abs__(self):
        'x.__abs__() <==> abs(x)'
        pass
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    def __and__(self):
        'x.__and__(y) <==> x&y'
        pass
    __class__ = long
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __coerce__(self):
        'x.__coerce__(y) <==> coerce(x, y)'
        pass
    def __div__(self):
        'x.__div__(y) <==> x/y'
        pass
    def __divmod__(self):
        'x.__divmod__(y) <==> divmod(x, y)'
        pass
    def __float__(self):
        'x.__float__() <==> float(x)'
        pass
    def __floordiv__(self):
        'x.__floordiv__(y) <==> x//y'
        pass
    def __format__(self, format_spec):
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getnewargs__(self):
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __hex__(self):
        'x.__hex__() <==> hex(x)'
        pass
    def __index__(self):
        'x[y:z] <==> x[y.__index__():z.__index__()]'
        pass
    def __int__(self):
        'x.__int__() <==> int(x)'
        pass
    def __invert__(self):
        'x.__invert__() <==> ~x'
        pass
    def __long__(self):
        'x.__long__() <==> long(x)'
        pass
    def __lshift__(self):
        'x.__lshift__(y) <==> x<<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(y) <==> x*y'
        pass
    def __neg__(self):
        'x.__neg__() <==> -x'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __nonzero__(self):
        'x.__nonzero__() <==> x != 0'
        pass
    def __oct__(self):
        'x.__oct__() <==> oct(x)'
        pass
    def __or__(self):
        'x.__or__(y) <==> x|y'
        pass
    def __pos__(self):
        'x.__pos__() <==> +x'
        pass
    def __pow__(self):
        'x.__pow__(y[, z]) <==> pow(x, y[, z])'
        pass
    def __radd__(self):
        'x.__radd__(y) <==> y+x'
        pass
    def __rand__(self):
        'x.__rand__(y) <==> y&x'
        pass
    def __rdiv__(self):
        'x.__rdiv__(y) <==> y/x'
        pass
    def __rdivmod__(self):
        'x.__rdivmod__(y) <==> divmod(y, x)'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rfloordiv__(self):
        'x.__rfloordiv__(y) <==> y//x'
        pass
    def __rlshift__(self):
        'x.__rlshift__(y) <==> y<<x'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(y) <==> y*x'
        pass
    def __ror__(self):
        'x.__ror__(y) <==> y|x'
        pass
    def __rpow__(self):
        'y.__rpow__(x[, z]) <==> pow(x, y[, z])'
        pass
    def __rrshift__(self):
        'x.__rrshift__(y) <==> y>>x'
        pass
    def __rshift__(self):
        'x.__rshift__(y) <==> x>>y'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rtruediv__(self):
        'x.__rtruediv__(y) <==> y/x'
        pass
    def __rxor__(self):
        'x.__rxor__(y) <==> y^x'
        pass
    def __sizeof__(self):
        'Returns size in memory, in bytes'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __truediv__(self):
        'x.__truediv__(y) <==> x/y'
        pass
    def __trunc__(self):
        'Truncating an Integral returns itself.'
        pass
    def __xor__(self):
        'x.__xor__(y) <==> x^y'
        pass
    def bit_length(self):
        "long.bit_length() -> int or long\n\nNumber of bits necessary to represent self in binary.\n>>> bin(37L)\n'0b100101'\n>>> (37L).bit_length()\n6"
        pass
    def conjugate(self):
        'Returns self, the complex conjugate of any long.'
        pass
    denominator = getset_descriptor()
    imag = getset_descriptor()
    numerator = getset_descriptor()
    real = getset_descriptor()
__Long = long
class float(object):
    'float(x) -> floating point number\n\nConvert a string or number to a floating point number, if possible.'
    def __abs__(self):
        'x.__abs__() <==> abs(x)'
        pass
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = float
    def __coerce__(self):
        'x.__coerce__(y) <==> coerce(x, y)'
        pass
    def __div__(self):
        'x.__div__(y) <==> x/y'
        pass
    def __divmod__(self):
        'x.__divmod__(y) <==> divmod(x, y)'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __float__(self):
        'x.__float__() <==> float(x)'
        pass
    def __floordiv__(self):
        'x.__floordiv__(y) <==> x//y'
        pass
    def __format__(self, format_spec):
        'float.__format__(format_spec) -> string\n\nFormats the float according to format_spec.'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getformat__(self):
        "float.__getformat__(typestr) -> string\n\nYou probably don't want to use this function.  It exists mainly to be\nused in Python's test suite.\n\ntypestr must be 'double' or 'float'.  This function returns whichever of\n'unknown', 'IEEE, big-endian' or 'IEEE, little-endian' best describes the\nformat of floating point numbers used by the C type named by typestr."
        pass
    def __getnewargs__(self):
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __int__(self):
        'x.__int__() <==> int(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __long__(self):
        'x.__long__() <==> long(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(y) <==> x*y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __neg__(self):
        'x.__neg__() <==> -x'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __nonzero__(self):
        'x.__nonzero__() <==> x != 0'
        pass
    def __pos__(self):
        'x.__pos__() <==> +x'
        pass
    def __pow__(self):
        'x.__pow__(y[, z]) <==> pow(x, y[, z])'
        pass
    def __radd__(self):
        'x.__radd__(y) <==> y+x'
        pass
    def __rdiv__(self):
        'x.__rdiv__(y) <==> y/x'
        pass
    def __rdivmod__(self):
        'x.__rdivmod__(y) <==> divmod(y, x)'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rfloordiv__(self):
        'x.__rfloordiv__(y) <==> y//x'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(y) <==> y*x'
        pass
    def __rpow__(self):
        'y.__rpow__(x[, z]) <==> pow(x, y[, z])'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rtruediv__(self):
        'x.__rtruediv__(y) <==> y/x'
        pass
    def __setformat__(self):
        "float.__setformat__(typestr, fmt) -> None\n\nYou probably don't want to use this function.  It exists mainly to be\nused in Python's test suite.\n\ntypestr must be 'double' or 'float'.  fmt must be one of 'unknown',\n'IEEE, big-endian' or 'IEEE, little-endian', and in addition can only be\none of the latter two if it appears to match the underlying C reality.\n\nOverrides the automatic determination of C-level floating point type.\nThis affects how floats are converted to and from binary strings."
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __truediv__(self):
        'x.__truediv__(y) <==> x/y'
        pass
    def __trunc__(self):
        'Returns the Integral closest to x between 0 and x.'
        pass
    def as_integer_ratio(self):
        'float.as_integer_ratio() -> (int, int)\n\nReturns a pair of integers, whose ratio is exactly equal to the original\nfloat and with a positive denominator.\nRaises OverflowError on infinities and a ValueError on NaNs.\n\n>>> (10.0).as_integer_ratio()\n(10, 1)\n>>> (0.0).as_integer_ratio()\n(0, 1)\n>>> (-.25).as_integer_ratio()\n(-1, 4)'
        pass
    def conjugate(self):
        'Returns self, the complex conjugate of any float.'
        pass
    def fromhex(self):
        "float.fromhex(string) -> float\n\nCreate a floating-point number from a hexadecimal string.\n>>> float.fromhex('0x1.ffffp10')\n2047.984375\n>>> float.fromhex('-0x1p-1074')\n-4.9406564584124654e-324"
        pass
    def hex(self):
        "float.hex() -> string\n\nReturn a hexadecimal representation of a floating-point number.\n>>> (-0.1).hex()\n'-0x1.999999999999ap-4'\n>>> 3.14159.hex()\n'0x1.921f9f01b866ep+1'"
        pass
    imag = getset_descriptor()
    def is_integer(self):
        'Returns True if the float is an integer.'
        pass
    real = getset_descriptor()
__Float = float
class complex(object):
    'complex(real[, imag]) -> complex number\n\nCreate a complex number from a real part and an optional imaginary part.\nThis is equivalent to (real + imag*1j) where imag defaults to 0.'
    def __abs__(self):
        'x.__abs__() <==> abs(x)'
        pass
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = complex
    def __coerce__(self):
        'x.__coerce__(y) <==> coerce(x, y)'
        pass
    def __div__(self):
        'x.__div__(y) <==> x/y'
        pass
    def __divmod__(self):
        'x.__divmod__(y) <==> divmod(x, y)'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __float__(self):
        'x.__float__() <==> float(x)'
        pass
    def __floordiv__(self):
        'x.__floordiv__(y) <==> x//y'
        pass
    def __format__(self, format_spec):
        'complex.__format__() -> str\n\nConverts to a string according to format_spec.'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getnewargs__(self):
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __int__(self):
        'x.__int__() <==> int(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __long__(self):
        'x.__long__() <==> long(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(y) <==> x*y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __neg__(self):
        'x.__neg__() <==> -x'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __nonzero__(self):
        'x.__nonzero__() <==> x != 0'
        pass
    def __pos__(self):
        'x.__pos__() <==> +x'
        pass
    def __pow__(self):
        'x.__pow__(y[, z]) <==> pow(x, y[, z])'
        pass
    def __radd__(self):
        'x.__radd__(y) <==> y+x'
        pass
    def __rdiv__(self):
        'x.__rdiv__(y) <==> y/x'
        pass
    def __rdivmod__(self):
        'x.__rdivmod__(y) <==> divmod(y, x)'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rfloordiv__(self):
        'x.__rfloordiv__(y) <==> y//x'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(y) <==> y*x'
        pass
    def __rpow__(self):
        'y.__rpow__(x[, z]) <==> pow(x, y[, z])'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rtruediv__(self):
        'x.__rtruediv__(y) <==> y/x'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __truediv__(self):
        'x.__truediv__(y) <==> x/y'
        pass
    def conjugate(self):
        'complex.conjugate() -> complex\n\nReturns the complex conjugate of its argument. (3-4j).conjugate() == 3+4j.'
        pass
    imag = member_descriptor()
    real = member_descriptor()
__Complex = complex
class tuple(object):
    "tuple() -> empty tuple\ntuple(iterable) -> tuple initialized from iterable's items\n\nIf the argument is a tuple, the return value is the same object."
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = tuple
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getnewargs__(self):
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __sizeof__(self):
        'T.__sizeof__() -- size of T in memory, in bytes'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def count(self, x):
        'T.count(value) -> integer -- return number of occurrences of value'
        pass
    def index(self, v):
        'T.index(value, [start, [stop]]) -> integer -- return first index of value.\nRaises ValueError if the value is not present.'
        pass
__Tuple = tuple
class list(object):
    "list() -> new empty list\nlist(iterable) -> new list initialized from iterable's items"
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = list
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __delitem__(self):
        'x.__delitem__(y) <==> del x[y]'
        pass
    def __delslice__(self):
        'x.__delslice__(i, j) <==> del x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    __hash__
    def __iadd__(self):
        'x.__iadd__(y) <==> x+=y'
        pass
    def __imul__(self):
        'x.__imul__(y) <==> x*=y'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __reversed__(self):
        'L.__reversed__() -- return a reverse iterator over the list'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __setitem__(self, index, value):
        'x.__setitem__(i, y) <==> x[i]=y'
        pass
    def __setslice__(self):
        'x.__setslice__(i, j, y) <==> x[i:j]=y\n           \n           Use  of negative indices is not supported.'
        pass
    def __sizeof__(self):
        'L.__sizeof__() -- size of L in memory, in bytes'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def append(self):
        'L.append(object) -- append object to end'
        pass
    def count(self, x):
        'L.count(value) -> integer -- return number of occurrences of value'
        pass
    def extend(self):
        'L.extend(iterable) -- extend list by appending elements from the iterable'
        pass
    def index(self, v):
        'L.index(value, [start, [stop]]) -> integer -- return first index of value.\nRaises ValueError if the value is not present.'
        pass
    def insert(self):
        'L.insert(index, object) -- insert object before index'
        pass
    def pop(self):
        'L.pop([index]) -> item -- remove and return item at index (default last).\nRaises IndexError if list is empty or index is out of range.'
        pass
    def remove(self):
        'L.remove(value) -- remove first occurrence of value.\nRaises ValueError if the value is not present.'
        pass
    def reverse(self):
        'L.reverse() -- reverse *IN PLACE*'
        pass
    def sort(self):
        'L.sort(cmp=None, key=None, reverse=False) -- stable sort *IN PLACE*;\ncmp(x, y) -> -1, 0, 1'
        pass
__List = list
class dict(object):
    "dict() -> new empty dictionary\ndict(mapping) -> new dictionary initialized from a mapping object's\n    (key, value) pairs\ndict(iterable) -> new dictionary initialized as if via:\n    d = {}\n    for k, v in iterable:\n        d[k] = v\ndict(**kwargs) -> new dictionary initialized with the name=value pairs\n    in the keyword argument list.  For example:  dict(one=1, two=2)"
    __class__ = dict
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __contains__(self, value):
        'D.__contains__(k) -> True if D has a key k, else False'
        pass
    def __delitem__(self):
        'x.__delitem__(y) <==> del x[y]'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    __hash__
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setitem__(self, index, value):
        'x.__setitem__(i, y) <==> x[i]=y'
        pass
    def __sizeof__(self):
        'D.__sizeof__() -> size of D in memory, in bytes'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def clear(self):
        'D.clear() -> None.  Remove all items from D.'
        pass
    def copy(self):
        'D.copy() -> a shallow copy of D'
        pass
    def fromkeys(self):
        'dict.fromkeys(S[,v]) -> New dict with keys from S and values equal to v.\nv defaults to None.'
        pass
    def get(self):
        'D.get(k[,d]) -> D[k] if k in D, else d.  d defaults to None.'
        pass
    def has_key(self):
        'D.has_key(k) -> True if D has a key k, else False'
        pass
    def items(self):
        "D.items() -> list of D's (key, value) pairs, as 2-tuples"
        pass
    def iteritems(self):
        'D.iteritems() -> an iterator over the (key, value) items of D'
        pass
    def iterkeys(self):
        'D.iterkeys() -> an iterator over the keys of D'
        pass
    def itervalues(self):
        'D.itervalues() -> an iterator over the values of D'
        pass
    def keys(self):
        "D.keys() -> list of D's keys"
        pass
    def pop(self):
        'D.pop(k[,d]) -> v, remove specified key and return the corresponding value.\nIf key is not found, d is returned if given, otherwise KeyError is raised'
        pass
    def popitem(self):
        'D.popitem() -> (k, v), remove and return some (key, value) pair as a\n2-tuple; but raise KeyError if D is empty.'
        pass
    def setdefault(self):
        'D.setdefault(k[,d]) -> D.get(k,d), also set D[k]=d if k not in D'
        pass
    def update(self):
        'D.update(E, **F) -> None.  Update D from dict/iterable E and F.\nIf E has a .keys() method, does:     for k in E: D[k] = E[k]\nIf E lacks .keys() method, does:     for (k, v) in E: D[k] = v\nIn either case, this is followed by: for k in F: D[k] = F[k]'
        pass
    def values(self):
        "D.values() -> list of D's values"
        pass
    def viewitems(self):
        "D.viewitems() -> a set-like object providing a view on D's items"
        pass
    def viewkeys(self):
        "D.viewkeys() -> a set-like object providing a view on D's keys"
        pass
    def viewvalues(self):
        "D.viewvalues() -> an object providing a view on D's values"
        pass
__Dict = dict
class set(object):
    'set() -> new empty set object\nset(iterable) -> new set object\n\nBuild an unordered collection of unique elements.'
    def __and__(self):
        'x.__and__(y) <==> x&y'
        pass
    __class__ = set
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x.'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    __hash__
    def __iand__(self):
        'x.__iand__(y) <==> x&y'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __ior__(self):
        'x.__ior__(y) <==> x|y'
        pass
    def __isub__(self):
        'x.__isub__(y) <==> x-y'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __ixor__(self):
        'x.__ixor__(y) <==> x^y'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __or__(self):
        'x.__or__(y) <==> x|y'
        pass
    def __rand__(self):
        'x.__rand__(y) <==> y&x'
        pass
    def __reduce__(self):
        'Return state information for pickling.'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __ror__(self):
        'x.__ror__(y) <==> y|x'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rxor__(self):
        'x.__rxor__(y) <==> y^x'
        pass
    def __sizeof__(self):
        'S.__sizeof__() -> size of S in memory, in bytes'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __xor__(self):
        'x.__xor__(y) <==> x^y'
        pass
    def add(self):
        'Add an element to a set.\n\nThis has no effect if the element is already present.'
        pass
    def clear(self):
        'Remove all elements from this set.'
        pass
    def copy(self):
        'Return a shallow copy of a set.'
        pass
    def difference(self):
        'Return the difference of two or more sets as a new set.\n\n(i.e. all elements that are in this set but not the others.)'
        pass
    def difference_update(self):
        'Remove all elements of another set from this set.'
        pass
    def discard(self):
        'Remove an element from a set if it is a member.\n\nIf the element is not a member, do nothing.'
        pass
    def intersection(self):
        'Return the intersection of two or more sets as a new set.\n\n(i.e. elements that are common to all of the sets.)'
        pass
    def intersection_update(self):
        'Update a set with the intersection of itself and another.'
        pass
    def isdisjoint(self):
        'Return True if two sets have a null intersection.'
        pass
    def issubset(self):
        'Report whether another set contains this set.'
        pass
    def issuperset(self):
        'Report whether this set contains another set.'
        pass
    def pop(self):
        'Remove and return an arbitrary set element.\nRaises KeyError if the set is empty.'
        pass
    def remove(self):
        'Remove an element from a set; it must be a member.\n\nIf the element is not a member, raise a KeyError.'
        pass
    def symmetric_difference(self):
        'Return the symmetric difference of two sets as a new set.\n\n(i.e. all elements that are in exactly one of the sets.)'
        pass
    def symmetric_difference_update(self):
        'Update a set with the symmetric difference of itself and another.'
        pass
    def union(self):
        'Return the union of sets as a new set.\n\n(i.e. all elements that are in either set.)'
        pass
    def update(self):
        'Update a set with the union of itself and others.'
        pass
__Set = set
class frozenset(object):
    'frozenset() -> empty frozenset object\nfrozenset(iterable) -> frozenset object\n\nBuild an immutable unordered collection of unique elements.'
    def __and__(self):
        'x.__and__(y) <==> x&y'
        pass
    __class__ = frozenset
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x.'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __or__(self):
        'x.__or__(y) <==> x|y'
        pass
    def __rand__(self):
        'x.__rand__(y) <==> y&x'
        pass
    def __reduce__(self):
        'Return state information for pickling.'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __ror__(self):
        'x.__ror__(y) <==> y|x'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rxor__(self):
        'x.__rxor__(y) <==> y^x'
        pass
    def __sizeof__(self):
        'S.__sizeof__() -> size of S in memory, in bytes'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __xor__(self):
        'x.__xor__(y) <==> x^y'
        pass
    def copy(self):
        'Return a shallow copy of a set.'
        pass
    def difference(self):
        'Return the difference of two or more sets as a new set.\n\n(i.e. all elements that are in this set but not the others.)'
        pass
    def intersection(self):
        'Return the intersection of two or more sets as a new set.\n\n(i.e. elements that are common to all of the sets.)'
        pass
    def isdisjoint(self):
        'Return True if two sets have a null intersection.'
        pass
    def issubset(self):
        'Report whether another set contains this set.'
        pass
    def issuperset(self):
        'Report whether this set contains another set.'
        pass
    def symmetric_difference(self):
        'Return the symmetric difference of two sets as a new set.\n\n(i.e. all elements that are in exactly one of the sets.)'
        pass
    def union(self):
        'Return the union of sets as a new set.\n\n(i.e. all elements that are in either set.)'
        pass
__FrozenSet = frozenset
class str(basestring):
    'str(object) -> string\n\nReturn a nice string representation of the object.\nIf the argument is a string, the return value is the same object.'
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = str
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __format__(self, format_spec):
        'S.__format__(format_spec) -> unicode\n\n'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getnewargs__(self):
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __sizeof__(self):
        'S.__sizeof__() -> size of S in memory, in bytes'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def _formatter_field_name_split(self):
        pass
    def _formatter_parser(self):
        pass
    def capitalize(self):
        'S.capitalize() -> string\n\nReturn a copy of the string S with only its first character\ncapitalized.'
        pass
    def center(self):
        'S.center(width[, fillchar]) -> string\n\nReturn S centered in a string of length width. Padding is\ndone using the specified fill character (default is a space)'
        pass
    def count(self, x):
        'S.count(sub[, start[, end]]) -> int\n\nReturn the number of non-overlapping occurrences of substring sub in\nstring S[start:end].  Optional arguments start and end are interpreted\nas in slice notation.'
        pass
    def decode(self):
        "S.decode([encoding[,errors]]) -> object\n\nDecodes S using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme. Default is 'strict' meaning that encoding errors raise\na UnicodeDecodeError. Other possible values are 'ignore' and 'replace'\nas well as any other name registered with codecs.register_error that is\nable to handle UnicodeDecodeErrors."
        pass
    def encode(self):
        "S.encode([encoding[,errors]]) -> object\n\nEncodes S using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme. Default is 'strict' meaning that encoding errors raise\na UnicodeEncodeError. Other possible values are 'ignore', 'replace' and\n'xmlcharrefreplace' as well as any other name registered with\ncodecs.register_error that is able to handle UnicodeEncodeErrors."
        pass
    def endswith(self, suffix, start=0, end=-1):
        'S.endswith(suffix[, start[, end]]) -> bool\n\nReturn True if S ends with the specified suffix, False otherwise.\nWith optional start, test S beginning at that position.\nWith optional end, stop comparing S at that position.\nsuffix can also be a tuple of strings to try.'
        pass
    def expandtabs(self, tabsize=8):
        'S.expandtabs([tabsize]) -> string\n\nReturn a copy of S where all tab characters are expanded using spaces.\nIf tabsize is not given, a tab size of 8 characters is assumed.'
        pass
    def find(self, sub, start=0, end=-1):
        'S.find(sub [,start [,end]]) -> int\n\nReturn the lowest index in S where substring sub is found,\nsuch that sub is contained within s[start:end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def format(self):
        'S.format(*args, **kwargs) -> unicode\n\n'
        pass
    def index(self, v):
        'S.index(sub [,start [,end]]) -> int\n\nLike S.find() but raise ValueError when the substring is not found.'
        pass
    def isalnum(self):
        'S.isalnum() -> bool\n\nReturn True if all characters in S are alphanumeric\nand there is at least one character in S, False otherwise.'
        pass
    def isalpha(self):
        'S.isalpha() -> bool\n\nReturn True if all characters in S are alphabetic\nand there is at least one character in S, False otherwise.'
        pass
    def isdigit(self):
        'S.isdigit() -> bool\n\nReturn True if all characters in S are digits\nand there is at least one character in S, False otherwise.'
        pass
    def islower(self):
        'S.islower() -> bool\n\nReturn True if all cased characters in S are lowercase and there is\nat least one cased character in S, False otherwise.'
        pass
    def isspace(self):
        'S.isspace() -> bool\n\nReturn True if all characters in S are whitespace\nand there is at least one character in S, False otherwise.'
        pass
    def istitle(self):
        'S.istitle() -> bool\n\nReturn True if S is a titlecased string and there is at least one\ncharacter in S, i.e. uppercase characters may only follow uncased\ncharacters and lowercase characters only cased ones. Return False\notherwise.'
        pass
    def isupper(self):
        'S.isupper() -> bool\n\nReturn True if all cased characters in S are uppercase and there is\nat least one cased character in S, False otherwise.'
        pass
    def join(self):
        'S.join(iterable) -> string\n\nReturn a string which is the concatenation of the strings in the\niterable.  The separator between elements is S.'
        pass
    def ljust(self):
        'S.ljust(width[, fillchar]) -> string\n\nReturn S left-justified in a string of length width. Padding is\ndone using the specified fill character (default is a space).'
        pass
    def lower(self):
        'S.lower() -> string\n\nReturn a copy of the string S converted to lowercase.'
        pass
    def lstrip(self, chars):
        'S.lstrip([chars]) -> string or unicode\n\nReturn a copy of the string S with leading whitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is unicode, S will be converted to unicode before stripping'
        pass
    def partition(self):
        'S.partition(sep) -> (head, sep, tail)\n\nSearch for the separator sep in S, and return the part before it,\nthe separator itself, and the part after it.  If the separator is not\nfound, return S and two empty strings.'
        pass
    def replace(self, old, new, count=-1):
        'S.replace(old, new[, count]) -> string\n\nReturn a copy of string S with all occurrences of substring\nold replaced by new.  If the optional argument count is\ngiven, only the first count occurrences are replaced.'
        pass
    def rfind(self, sub, start=0, end=-1):
        'S.rfind(sub [,start [,end]]) -> int\n\nReturn the highest index in S where substring sub is found,\nsuch that sub is contained within s[start:end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def rindex(self, sub, start=0, end=-1):
        'S.rindex(sub [,start [,end]]) -> int\n\nLike S.rfind() but raise ValueError when the substring is not found.'
        pass
    def rjust(self):
        'S.rjust(width[, fillchar]) -> string\n\nReturn S right-justified in a string of length width. Padding is\ndone using the specified fill character (default is a space)'
        pass
    def rpartition(self):
        'S.rpartition(sep) -> (head, sep, tail)\n\nSearch for the separator sep in S, starting at the end of S, and return\nthe part before it, the separator itself, and the part after it.  If the\nseparator is not found, return two empty strings and S.'
        pass
    def rsplit(self, sep=None, maxsplit=-1):
        'S.rsplit([sep [,maxsplit]]) -> list of strings\n\nReturn a list of the words in the string S, using sep as the\ndelimiter string, starting at the end of the string and working\nto the front.  If maxsplit is given, at most maxsplit splits are\ndone. If sep is not specified or is None, any whitespace string\nis a separator.'
        pass
    def rstrip(self, chars=None):
        'S.rstrip([chars]) -> string or unicode\n\nReturn a copy of the string S with trailing whitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is unicode, S will be converted to unicode before stripping'
        pass
    def split(self, sep=None, maxsplit=-1):
        'S.split([sep [,maxsplit]]) -> list of strings\n\nReturn a list of the words in the string S, using sep as the\ndelimiter string.  If maxsplit is given, at most maxsplit\nsplits are done. If sep is not specified or is None, any\nwhitespace string is a separator and empty strings are removed\nfrom the result.'
        pass
    def splitlines(self, keepends=False):
        'S.splitlines([keepends]) -> list of strings\n\nReturn a list of the lines in S, breaking at line boundaries.\nLine breaks are not included in the resulting list unless keepends\nis given and true.'
        pass
    def startswith(self, prefix, start=0, end=-1):
        'S.startswith(prefix[, start[, end]]) -> bool\n\nReturn True if S starts with the specified prefix, False otherwise.\nWith optional start, test S beginning at that position.\nWith optional end, stop comparing S at that position.\nprefix can also be a tuple of strings to try.'
        pass
    def strip(self, chars=None):
        'S.strip([chars]) -> string or unicode\n\nReturn a copy of the string S with leading and trailing\nwhitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is unicode, S will be converted to unicode before stripping'
        pass
    def swapcase(self):
        'S.swapcase() -> string\n\nReturn a copy of the string S with uppercase characters\nconverted to lowercase and vice versa.'
        pass
    def title(self):
        'S.title() -> string\n\nReturn a titlecased version of S, i.e. words start with uppercase\ncharacters, all remaining cased characters have lowercase.'
        pass
    def translate(self):
        'S.translate(table [,deletechars]) -> string\n\nReturn a copy of the string S, where all characters occurring\nin the optional argument deletechars are removed, and the\nremaining characters have been mapped through the given\ntranslation table, which must be a string of length 256.'
        pass
    def upper(self):
        'S.upper() -> string\n\nReturn a copy of the string S converted to uppercase.'
        pass
    def zfill(self, width):
        'S.zfill(width) -> string\n\nPad a numeric string S with zeros on the left, to fill a field\nof the specified width.  The string S is never truncated.'
        pass
__Bytes = str
class iterator(object):
    __class__ = iterator
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __length_hint__(self):
        'Private method returning an estimate of len(list(it)).'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def next(self):
        'x.next() -> the next value, or raise StopIteration'
        pass
__BytesIterator = iterator
class unicode(basestring):
    "unicode(string [, encoding[, errors]]) -> object\n\nCreate a new Unicode object from the given encoded string.\nencoding defaults to the current default string encoding.\nerrors can be 'strict', 'replace' or 'ignore' and defaults to 'strict'."
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = unicode
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __format__(self, format_spec):
        'S.__format__(format_spec) -> unicode\n\n'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getnewargs__(self):
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __sizeof__(self):
        'S.__sizeof__() -> size of S in memory, in bytes\n\n'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def _formatter_field_name_split(self):
        pass
    def _formatter_parser(self):
        pass
    def capitalize(self):
        'S.capitalize() -> unicode\n\nReturn a capitalized version of S, i.e. make the first character\nhave upper case.'
        pass
    def center(self):
        'S.center(width[, fillchar]) -> unicode\n\nReturn S centered in a Unicode string of length width. Padding is\ndone using the specified fill character (default is a space)'
        pass
    def count(self, x):
        'S.count(sub[, start[, end]]) -> int\n\nReturn the number of non-overlapping occurrences of substring sub in\nUnicode string S[start:end].  Optional arguments start and end are\ninterpreted as in slice notation.'
        pass
    def decode(self):
        "S.decode([encoding[,errors]]) -> string or unicode\n\nDecodes S using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme. Default is 'strict' meaning that encoding errors raise\na UnicodeDecodeError. Other possible values are 'ignore' and 'replace'\nas well as any other name registerd with codecs.register_error that is\nable to handle UnicodeDecodeErrors."
        pass
    def encode(self):
        "S.encode([encoding[,errors]]) -> string or unicode\n\nEncodes S using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme. Default is 'strict' meaning that encoding errors raise\na UnicodeEncodeError. Other possible values are 'ignore', 'replace' and\n'xmlcharrefreplace' as well as any other name registered with\ncodecs.register_error that can handle UnicodeEncodeErrors."
        pass
    def endswith(self, suffix, start=0, end=-1):
        'S.endswith(suffix[, start[, end]]) -> bool\n\nReturn True if S ends with the specified suffix, False otherwise.\nWith optional start, test S beginning at that position.\nWith optional end, stop comparing S at that position.\nsuffix can also be a tuple of strings to try.'
        pass
    def expandtabs(self, tabsize=8):
        'S.expandtabs([tabsize]) -> unicode\n\nReturn a copy of S where all tab characters are expanded using spaces.\nIf tabsize is not given, a tab size of 8 characters is assumed.'
        pass
    def find(self, sub, start=0, end=-1):
        'S.find(sub [,start [,end]]) -> int\n\nReturn the lowest index in S where substring sub is found,\nsuch that sub is contained within s[start:end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def format(self):
        'S.format(*args, **kwargs) -> unicode\n\n'
        pass
    def index(self, v):
        'S.index(sub [,start [,end]]) -> int\n\nLike S.find() but raise ValueError when the substring is not found.'
        pass
    def isalnum(self):
        'S.isalnum() -> bool\n\nReturn True if all characters in S are alphanumeric\nand there is at least one character in S, False otherwise.'
        pass
    def isalpha(self):
        'S.isalpha() -> bool\n\nReturn True if all characters in S are alphabetic\nand there is at least one character in S, False otherwise.'
        pass
    def isdecimal(self):
        'S.isdecimal() -> bool\n\nReturn True if there are only decimal characters in S,\nFalse otherwise.'
        pass
    def isdigit(self):
        'S.isdigit() -> bool\n\nReturn True if all characters in S are digits\nand there is at least one character in S, False otherwise.'
        pass
    def islower(self):
        'S.islower() -> bool\n\nReturn True if all cased characters in S are lowercase and there is\nat least one cased character in S, False otherwise.'
        pass
    def isnumeric(self):
        'S.isnumeric() -> bool\n\nReturn True if there are only numeric characters in S,\nFalse otherwise.'
        pass
    def isspace(self):
        'S.isspace() -> bool\n\nReturn True if all characters in S are whitespace\nand there is at least one character in S, False otherwise.'
        pass
    def istitle(self):
        'S.istitle() -> bool\n\nReturn True if S is a titlecased string and there is at least one\ncharacter in S, i.e. upper- and titlecase characters may only\nfollow uncased characters and lowercase characters only cased ones.\nReturn False otherwise.'
        pass
    def isupper(self):
        'S.isupper() -> bool\n\nReturn True if all cased characters in S are uppercase and there is\nat least one cased character in S, False otherwise.'
        pass
    def join(self):
        'S.join(iterable) -> unicode\n\nReturn a string which is the concatenation of the strings in the\niterable.  The separator between elements is S.'
        pass
    def ljust(self):
        'S.ljust(width[, fillchar]) -> int\n\nReturn S left-justified in a Unicode string of length width. Padding is\ndone using the specified fill character (default is a space).'
        pass
    def lower(self):
        'S.lower() -> unicode\n\nReturn a copy of the string S converted to lowercase.'
        pass
    def lstrip(self, chars):
        'S.lstrip([chars]) -> unicode\n\nReturn a copy of the string S with leading whitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is a str, it will be converted to unicode before stripping'
        pass
    def partition(self):
        'S.partition(sep) -> (head, sep, tail)\n\nSearch for the separator sep in S, and return the part before it,\nthe separator itself, and the part after it.  If the separator is not\nfound, return S and two empty strings.'
        pass
    def replace(self, old, new, count=-1):
        'S.replace(old, new[, count]) -> unicode\n\nReturn a copy of S with all occurrences of substring\nold replaced by new.  If the optional argument count is\ngiven, only the first count occurrences are replaced.'
        pass
    def rfind(self, sub, start=0, end=-1):
        'S.rfind(sub [,start [,end]]) -> int\n\nReturn the highest index in S where substring sub is found,\nsuch that sub is contained within s[start:end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def rindex(self, sub, start=0, end=-1):
        'S.rindex(sub [,start [,end]]) -> int\n\nLike S.rfind() but raise ValueError when the substring is not found.'
        pass
    def rjust(self):
        'S.rjust(width[, fillchar]) -> unicode\n\nReturn S right-justified in a Unicode string of length width. Padding is\ndone using the specified fill character (default is a space).'
        pass
    def rpartition(self):
        'S.rpartition(sep) -> (head, sep, tail)\n\nSearch for the separator sep in S, starting at the end of S, and return\nthe part before it, the separator itself, and the part after it.  If the\nseparator is not found, return two empty strings and S.'
        pass
    def rsplit(self, sep=None, maxsplit=-1):
        'S.rsplit([sep [,maxsplit]]) -> list of strings\n\nReturn a list of the words in S, using sep as the\ndelimiter string, starting at the end of the string and\nworking to the front.  If maxsplit is given, at most maxsplit\nsplits are done. If sep is not specified, any whitespace string\nis a separator.'
        pass
    def rstrip(self, chars=None):
        'S.rstrip([chars]) -> unicode\n\nReturn a copy of the string S with trailing whitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is a str, it will be converted to unicode before stripping'
        pass
    def split(self, sep=None, maxsplit=-1):
        'S.split([sep [,maxsplit]]) -> list of strings\n\nReturn a list of the words in S, using sep as the\ndelimiter string.  If maxsplit is given, at most maxsplit\nsplits are done. If sep is not specified or is None, any\nwhitespace string is a separator and empty strings are\nremoved from the result.'
        pass
    def splitlines(self, keepends=False):
        'S.splitlines([keepends]) -> list of strings\n\nReturn a list of the lines in S, breaking at line boundaries.\nLine breaks are not included in the resulting list unless keepends\nis given and true.'
        pass
    def startswith(self, prefix, start=0, end=-1):
        'S.startswith(prefix[, start[, end]]) -> bool\n\nReturn True if S starts with the specified prefix, False otherwise.\nWith optional start, test S beginning at that position.\nWith optional end, stop comparing S at that position.\nprefix can also be a tuple of strings to try.'
        pass
    def strip(self, chars=None):
        'S.strip([chars]) -> unicode\n\nReturn a copy of the string S with leading and trailing\nwhitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is a str, it will be converted to unicode before stripping'
        pass
    def swapcase(self):
        'S.swapcase() -> unicode\n\nReturn a copy of S with uppercase characters converted to lowercase\nand vice versa.'
        pass
    def title(self):
        'S.title() -> unicode\n\nReturn a titlecased version of S, i.e. words start with title case\ncharacters, all remaining cased characters have lower case.'
        pass
    def translate(self):
        'S.translate(table) -> unicode\n\nReturn a copy of the string S, where all characters have been mapped\nthrough the given translation table, which must be a mapping of\nUnicode ordinals to Unicode ordinals, Unicode strings or None.\nUnmapped characters are left untouched. Characters mapped to None\nare deleted.'
        pass
    def upper(self):
        'S.upper() -> unicode\n\nReturn a copy of S converted to uppercase.'
        pass
    def zfill(self, width):
        'S.zfill(width) -> unicode\n\nPad a numeric string S with zeros on the left, to fill a field\nof the specified width. The string S is never truncated.'
        pass
__Unicode = unicode
class iterator(object):
    __class__ = iterator
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __length_hint__(self):
        'Private method returning an estimate of len(list(it)).'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def next(self):
        'x.next() -> the next value, or raise StopIteration'
        pass
__UnicodeIterator = iterator
__Str = __Bytes
__StrIterator = __BytesIterator
class module(object):
    'module(name[, doc])\n\nCreate a module object.\nThe name must be a string; the optional doc argument can have any type.'
    __class__ = module
    def __delattr__(self):
        "x.__delattr__('name') <==> del x.name"
        pass
    __dict__ = {}
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setattr__(self):
        "x.__setattr__('name', value) <==> x.name = value"
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
__Module = module
class function(object):
    'function(code, globals[, name[, argdefs[, closure]]])\n\nCreate a function object from a code object and a dictionary.\nThe optional name string overrides the name from the code object.\nThe optional argdefs tuple specifies the default argument values.\nThe optional closure tuple supplies the bindings for free variables.'
    def __call__(self):
        'x.__call__(...) <==> x(...)'
        pass
    __class__ = function
    __closure__ = member_descriptor()
    __code__ = getset_descriptor()
    __defaults__ = getset_descriptor()
    def __delattr__(self):
        "x.__delattr__('name') <==> del x.name"
        pass
    __dict__ = {}
    def __get__(self):
        'descr.__get__(obj[, type]) -> value'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    __globals__ = member_descriptor()
    __module__ = '__builtin__'
    __name__ = 'function'
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setattr__(self):
        "x.__setattr__('name', value) <==> x.name = value"
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    func_closure = member_descriptor()
    func_code = getset_descriptor()
    func_defaults = getset_descriptor()
    func_dict = getset_descriptor()
    func_doc = member_descriptor()
    func_globals = member_descriptor()
    func_name = getset_descriptor()
__Function = function
class wrapper_descriptor(object):
    def __call__(self):
        'x.__call__(...) <==> x(...)'
        pass
    __class__ = wrapper_descriptor
    def __get__(self):
        'descr.__get__(obj[, type]) -> value'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    __name__ = 'wrapper_descriptor'
    __objclass__ = member_descriptor()
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
__BuiltinMethodDescriptor = wrapper_descriptor
class builtin_function_or_method(object):
    def __call__(self):
        'x.__call__(...) <==> x(...)'
        pass
    __class__ = builtin_function_or_method
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    __module__ = '__builtin__'
    __name__ = 'builtin_function_or_method'
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    __self__ = getset_descriptor()
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
__BuiltinFunction = builtin_function_or_method
class generator(object):
    __class__ = generator
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    __name__ = 'generator'
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def close(arg):
        'close(arg) -> raise GeneratorExit inside generator.'
        pass
    gi_code = member_descriptor()
    gi_frame = member_descriptor()
    gi_running = member_descriptor()
    def next(self):
        'x.next() -> the next value, or raise StopIteration'
        pass
    def send(arg):
        "send(arg) -> send 'arg' into generator,\nreturn next yielded value or raise StopIteration."
        pass
    def throw(typ, val, tb):
        'throw(typ[,val[,tb]]) -> raise exception in generator,\nreturn next yielded value or raise StopIteration.'
        pass
__Generator = generator
class property(object):
    'property(fget=None, fset=None, fdel=None, doc=None) -> property attribute\n\nfget is a function to be used for getting an attribute value, and likewise\nfset is a function for setting, and fdel a function for del\'ing, an\nattribute.  Typical use is to define a managed attribute x:\nclass C(object):\n    def getx(self): return self._x\n    def setx(self, value): self._x = value\n    def delx(self): del self._x\n    x = property(getx, setx, delx, "I\'m the \'x\' property.")\n\nDecorators make defining new properties or modifying existing ones easy:\nclass C(object):\n    @property\n    def x(self): return self._x\n    @x.setter\n    def x(self, value): self._x = value\n    @x.deleter\n    def x(self): del self._x\n'
    __class__ = property
    def __delete__(self):
        'descr.__delete__(obj)'
        pass
    def __get__(self):
        'descr.__get__(obj[, type]) -> value'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __set__(self):
        'descr.__set__(obj, value)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def deleter(self):
        'Descriptor to change the deleter on a property.'
        pass
    fdel = member_descriptor()
    fget = member_descriptor()
    fset = member_descriptor()
    def getter(self):
        'Descriptor to change the getter on a property.'
        pass
    def setter(self):
        'Descriptor to change the setter on a property.'
        pass
__Property = property
class classmethod(object):
    'classmethod(function) -> method\n\nConvert a function to be a class method.\n\nA class method receives the class as implicit first argument,\njust like an instance method receives the instance.\nTo declare a class method, use this idiom:\n\n  class C:\n      def f(cls, arg1, arg2, ...): ...\n      f = classmethod(f)\n\nIt can be called either on the class (e.g. C.f()) or on an instance\n(e.g. C().f()).  The instance is ignored except for its class.\nIf a class method is called for a derived class, the derived class\nobject is passed as the implied first argument.\n\nClass methods are different than C++ or Java static methods.\nIf you want those, see the staticmethod builtin.'
    __class__ = classmethod
    __func__ = member_descriptor()
    def __get__(self):
        'descr.__get__(obj[, type]) -> value'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
__ClassMethod = classmethod
class staticmethod(object):
    'staticmethod(function) -> method\n\nConvert a function to be a static method.\n\nA static method does not receive an implicit first argument.\nTo declare a static method, use this idiom:\n\n     class C:\n     def f(arg1, arg2, ...): ...\n     f = staticmethod(f)\n\nIt can be called either on the class (e.g. C.f()) or on an instance\n(e.g. C().f()).  The instance is ignored except for its class.\n\nStatic methods in Python are similar to those found in Java or C++.\nFor a more advanced concept, see the classmethod builtin.'
    __class__ = staticmethod
    __func__ = member_descriptor()
    def __get__(self):
        'descr.__get__(obj[, type]) -> value'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
__StaticMethod = staticmethod
class ellipsis(object):
    __class__ = ellipsis
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
__Ellipsis = ellipsis
class tupleiterator(object):
    __class__ = tupleiterator
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __length_hint__(self):
        'Private method returning an estimate of len(list(it)).'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def next(self):
        'x.next() -> the next value, or raise StopIteration'
        pass
__TupleIterator = tupleiterator
class listiterator(object):
    __class__ = listiterator
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __length_hint__(self):
        'Private method returning an estimate of len(list(it)).'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def next(self):
        'x.next() -> the next value, or raise StopIteration'
        pass
__ListIterator = listiterator
class list(object):
    "list() -> new empty list\nlist(iterable) -> new list initialized from iterable's items"
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = list
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __delitem__(self):
        'x.__delitem__(y) <==> del x[y]'
        pass
    def __delslice__(self):
        'x.__delslice__(i, j) <==> del x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    __hash__
    def __iadd__(self):
        'x.__iadd__(y) <==> x+=y'
        pass
    def __imul__(self):
        'x.__imul__(y) <==> x*=y'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __reversed__(self):
        'L.__reversed__() -- return a reverse iterator over the list'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __setitem__(self, index, value):
        'x.__setitem__(i, y) <==> x[i]=y'
        pass
    def __setslice__(self):
        'x.__setslice__(i, j, y) <==> x[i:j]=y\n           \n           Use  of negative indices is not supported.'
        pass
    def __sizeof__(self):
        'L.__sizeof__() -- size of L in memory, in bytes'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def append(self):
        'L.append(object) -- append object to end'
        pass
    def count(self, x):
        'L.count(value) -> integer -- return number of occurrences of value'
        pass
    def extend(self):
        'L.extend(iterable) -- extend list by appending elements from the iterable'
        pass
    def index(self, v):
        'L.index(value, [start, [stop]]) -> integer -- return first index of value.\nRaises ValueError if the value is not present.'
        pass
    def insert(self):
        'L.insert(index, object) -- insert object before index'
        pass
    def pop(self):
        'L.pop([index]) -> item -- remove and return item at index (default last).\nRaises IndexError if list is empty or index is out of range.'
        pass
    def remove(self):
        'L.remove(value) -- remove first occurrence of value.\nRaises ValueError if the value is not present.'
        pass
    def reverse(self):
        'L.reverse() -- reverse *IN PLACE*'
        pass
    def sort(self):
        'L.sort(cmp=None, key=None, reverse=False) -- stable sort *IN PLACE*;\ncmp(x, y) -> -1, 0, 1'
        pass
__DictKeys = list
class list(object):
    "list() -> new empty list\nlist(iterable) -> new list initialized from iterable's items"
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = list
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __delitem__(self):
        'x.__delitem__(y) <==> del x[y]'
        pass
    def __delslice__(self):
        'x.__delslice__(i, j) <==> del x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    __hash__
    def __iadd__(self):
        'x.__iadd__(y) <==> x+=y'
        pass
    def __imul__(self):
        'x.__imul__(y) <==> x*=y'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __reversed__(self):
        'L.__reversed__() -- return a reverse iterator over the list'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __setitem__(self, index, value):
        'x.__setitem__(i, y) <==> x[i]=y'
        pass
    def __setslice__(self):
        'x.__setslice__(i, j, y) <==> x[i:j]=y\n           \n           Use  of negative indices is not supported.'
        pass
    def __sizeof__(self):
        'L.__sizeof__() -- size of L in memory, in bytes'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def append(self):
        'L.append(object) -- append object to end'
        pass
    def count(self, x):
        'L.count(value) -> integer -- return number of occurrences of value'
        pass
    def extend(self):
        'L.extend(iterable) -- extend list by appending elements from the iterable'
        pass
    def index(self, v):
        'L.index(value, [start, [stop]]) -> integer -- return first index of value.\nRaises ValueError if the value is not present.'
        pass
    def insert(self):
        'L.insert(index, object) -- insert object before index'
        pass
    def pop(self):
        'L.pop([index]) -> item -- remove and return item at index (default last).\nRaises IndexError if list is empty or index is out of range.'
        pass
    def remove(self):
        'L.remove(value) -- remove first occurrence of value.\nRaises ValueError if the value is not present.'
        pass
    def reverse(self):
        'L.reverse() -- reverse *IN PLACE*'
        pass
    def sort(self):
        'L.sort(cmp=None, key=None, reverse=False) -- stable sort *IN PLACE*;\ncmp(x, y) -> -1, 0, 1'
        pass
__DictValues = list
class list(object):
    "list() -> new empty list\nlist(iterable) -> new list initialized from iterable's items"
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = list
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __delitem__(self):
        'x.__delitem__(y) <==> del x[y]'
        pass
    def __delslice__(self):
        'x.__delslice__(i, j) <==> del x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    __hash__
    def __iadd__(self):
        'x.__iadd__(y) <==> x+=y'
        pass
    def __imul__(self):
        'x.__imul__(y) <==> x*=y'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __reversed__(self):
        'L.__reversed__() -- return a reverse iterator over the list'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __setitem__(self, index, value):
        'x.__setitem__(i, y) <==> x[i]=y'
        pass
    def __setslice__(self):
        'x.__setslice__(i, j, y) <==> x[i:j]=y\n           \n           Use  of negative indices is not supported.'
        pass
    def __sizeof__(self):
        'L.__sizeof__() -- size of L in memory, in bytes'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def append(self):
        'L.append(object) -- append object to end'
        pass
    def count(self, x):
        'L.count(value) -> integer -- return number of occurrences of value'
        pass
    def extend(self):
        'L.extend(iterable) -- extend list by appending elements from the iterable'
        pass
    def index(self, v):
        'L.index(value, [start, [stop]]) -> integer -- return first index of value.\nRaises ValueError if the value is not present.'
        pass
    def insert(self):
        'L.insert(index, object) -- insert object before index'
        pass
    def pop(self):
        'L.pop([index]) -> item -- remove and return item at index (default last).\nRaises IndexError if list is empty or index is out of range.'
        pass
    def remove(self):
        'L.remove(value) -- remove first occurrence of value.\nRaises ValueError if the value is not present.'
        pass
    def reverse(self):
        'L.reverse() -- reverse *IN PLACE*'
        pass
    def sort(self):
        'L.sort(cmp=None, key=None, reverse=False) -- stable sort *IN PLACE*;\ncmp(x, y) -> -1, 0, 1'
        pass
__DictItems = list
class setiterator(object):
    __class__ = setiterator
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __length_hint__(self):
        'Private method returning an estimate of len(list(it)).'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def next(self):
        'x.next() -> the next value, or raise StopIteration'
        pass
__SetIterator = setiterator
class callable_iterator(object):
    __class__ = callable-iterator
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def next(self):
        'x.next() -> the next value, or raise StopIteration'
        pass
__CallableIterator = callable_iterator
__builtin_module_names = "__builtin__,__main__,_ast,_bisect,_codecs,_codecs_cn,_codecs_hk,_codecs_iso2022,_codecs_jp,_codecs_kr,_codecs_tw,_collections,_csv,_functools,_heapq,_hotshot,_io,_json,_locale,_lsprof,_md5,_multibytecodec,_random,_sha,_sha256,_sha512,_sre,_struct,_subprocess,_symtable,_warnings,_weakref,_winreg,array,audioop,binascii,cPickle,cStringIO,cmath,datetime,errno,exceptions,future_builtins,gc,imageop,imp,itertools,marshal,math,mmap,msvcrt,nt,operator,parser,signal,strop,sys,thread,time,xxsubtype,zipimport,zlib"
ArithmeticError = exceptions.ArithmeticError()
AssertionError = exceptions.AssertionError()
AttributeError = exceptions.AttributeError()
class BaseException(object):
    'Common base class for all exceptions'
    __class__ = exceptions.BaseException
    def __delattr__(self):
        "x.__delattr__('name') <==> del x.name"
        pass
    __dict__ = {}
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __reduce__(self):
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setattr__(self):
        "x.__setattr__('name', value) <==> x.name = value"
        pass
    def __setstate__(self, state):
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __unicode__(self):
        pass
    args = getset_descriptor()
    message = getset_descriptor()
BufferError = exceptions.BufferError()
BytesWarning = exceptions.BytesWarning()
DeprecationWarning = exceptions.DeprecationWarning()
EOFError = exceptions.EOFError()
class Ellipsis:
    __class__ = ellipsis
    def __delattr__(self):
        "x.__delattr__('name') <==> del x.name"
        pass
    def __format__(self, format_spec):
        'default object formatter'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __reduce__(self):
        'helper for pickle'
        pass
    def __reduce_ex__(self, protocol):
        'helper for pickle'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setattr__(self):
        "x.__setattr__('name', value) <==> x.name = value"
        pass
    def __sizeof__():
        '__sizeof__() -> size of object in memory, in bytes'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
EnvironmentError = exceptions.EnvironmentError()
Exception = exceptions.Exception()
FloatingPointError = exceptions.FloatingPointError()
FutureWarning = exceptions.FutureWarning()
GeneratorExit = exceptions.GeneratorExit()
IOError = exceptions.IOError()
ImportError = exceptions.ImportError()
ImportWarning = exceptions.ImportWarning()
IndentationError = exceptions.IndentationError()
IndexError = exceptions.IndexError()
KeyError = exceptions.KeyError()
KeyboardInterrupt = exceptions.KeyboardInterrupt()
LookupError = exceptions.LookupError()
MemoryError = exceptions.MemoryError()
NameError = exceptions.NameError()
class NotImplemented:
    __class__ = NotImplementedType
    def __delattr__(self):
        "x.__delattr__('name') <==> del x.name"
        pass
    def __format__(self, format_spec):
        'default object formatter'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __reduce__(self):
        'helper for pickle'
        pass
    def __reduce_ex__(self, protocol):
        'helper for pickle'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setattr__(self):
        "x.__setattr__('name', value) <==> x.name = value"
        pass
    def __sizeof__():
        '__sizeof__() -> size of object in memory, in bytes'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
NotImplementedError = exceptions.NotImplementedError()
OSError = exceptions.OSError()
OverflowError = exceptions.OverflowError()
PendingDeprecationWarning = exceptions.PendingDeprecationWarning()
ReferenceError = exceptions.ReferenceError()
RuntimeError = exceptions.RuntimeError()
RuntimeWarning = exceptions.RuntimeWarning()
StandardError = exceptions.StandardError()
StopIteration = exceptions.StopIteration()
SyntaxError = exceptions.SyntaxError()
SyntaxWarning = exceptions.SyntaxWarning()
SystemError = exceptions.SystemError()
SystemExit = exceptions.SystemExit()
TabError = exceptions.TabError()
TypeError = exceptions.TypeError()
UnboundLocalError = exceptions.UnboundLocalError()
UnicodeDecodeError = exceptions.UnicodeDecodeError()
UnicodeEncodeError = exceptions.UnicodeEncodeError()
UnicodeError = exceptions.UnicodeError()
UnicodeTranslateError = exceptions.UnicodeTranslateError()
UnicodeWarning = exceptions.UnicodeWarning()
UserWarning = exceptions.UserWarning()
ValueError = exceptions.ValueError()
Warning = exceptions.Warning()
WindowsError = exceptions.WindowsError()
ZeroDivisionError = exceptions.ZeroDivisionError()
__doc__ = "Built-in functions, exceptions, and other objects.\n\nNoteworthy: None is the `nil' object; Ellipsis represents `...' in slices."
def __import__(name, globals, locals, fromlist, level):
    "__import__(name, globals={}, locals={}, fromlist=[], level=-1) -> module\n\nImport a module.  The globals are only used to determine the context;\nthey are not modified.  The locals are currently unused.  The fromlist\nshould be a list of names to emulate ``from name import ...'', or an\nempty list to emulate ``import name''.\nWhen importing a module from a package, note that __import__('A.B', ...)\nreturns package A when fromlist is empty, but its submodule B when\nfromlist is not empty.  Level is used to determine whether to perform \nabsolute or relative imports.  -1 is the original strategy of attempting\nboth absolute and relative imports, 0 is absolute, a positive number\nis the number of parent directories to search relative to the current module."
    pass
__name__ = '__builtin__'
__package__
def abs(number):
    'abs(number) -> number\n\nReturn the absolute value of the argument.'
    pass
def all(iterable):
    'all(iterable) -> bool\n\nReturn True if bool(x) is True for all values x in the iterable.'
    pass
def any(iterable):
    'any(iterable) -> bool\n\nReturn True if bool(x) is True for any x in the iterable.'
    pass
def apply(object, args, kwargs):
    'apply(object[, args[, kwargs]]) -> value\n\nCall a callable object with positional arguments taken from the tuple args,\nand keyword arguments taken from the optional dictionary kwargs.\nNote that classes are callable, as are instances with a __call__() method.\n\nDeprecated since release 2.3. Instead, use the extended call syntax:\n    function(*args, **keywords).'
    pass
class basestring(object):
    'Type basestring cannot be instantiated; it is the base for str and unicode.'
    __class__ = basestring
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
def bin(number):
    'bin(number) -> string\n\nReturn the binary representation of an integer or long integer.'
    pass
class bool(int):
    'bool(x) -> bool\n\nReturns True when the argument x is true, False otherwise.\nThe builtins True and False are the only two instances of the class bool.\nThe class bool is a subclass of the class int, and cannot be subclassed.'
    def __and__(self):
        'x.__and__(y) <==> x&y'
        pass
    __class__ = bool
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __or__(self):
        'x.__or__(y) <==> x|y'
        pass
    def __rand__(self):
        'x.__rand__(y) <==> y&x'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __ror__(self):
        'x.__ror__(y) <==> y|x'
        pass
    def __rxor__(self):
        'x.__rxor__(y) <==> y^x'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __xor__(self):
        'x.__xor__(y) <==> x^y'
        pass
class buffer(object):
    'buffer(object [, offset[, size]])\n\nCreate a new buffer object which references the given object.\nThe buffer will reference a slice of the target object from the\nstart of the object (or at the specified offset). The slice will\nextend to the end of the target object (or with the specified size).'
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = buffer
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __delitem__(self):
        'x.__delitem__(y) <==> del x[y]'
        pass
    def __delslice__(self):
        'x.__delslice__(i, j) <==> del x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __setitem__(self, index, value):
        'x.__setitem__(i, y) <==> x[i]=y'
        pass
    def __setslice__(self):
        'x.__setslice__(i, j, y) <==> x[i:j]=y\n           \n           Use  of negative indices is not supported.'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
class bytearray(object):
    'bytearray(iterable_of_ints) -> bytearray.\nbytearray(string, encoding[, errors]) -> bytearray.\nbytearray(bytes_or_bytearray) -> mutable copy of bytes_or_bytearray.\nbytearray(memory_view) -> bytearray.\n\nConstruct an mutable bytearray object from:\n  - an iterable yielding integers in range(256)\n  - a text string encoded using the specified encoding\n  - a bytes or a bytearray object\n  - any object implementing the buffer API.\n\nbytearray(int) -> bytearray.\n\nConstruct a zero-initialized bytearray of the given length.'
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    def __alloc__(self):
        'B.__alloc__() -> int\n\nReturns the number of bytes actually allocated.'
        pass
    __class__ = bytearray
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __delitem__(self):
        'x.__delitem__(y) <==> del x[y]'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __iadd__(self):
        'x.__iadd__(y) <==> x+=y'
        pass
    def __imul__(self):
        'x.__imul__(y) <==> x*=y'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __reduce__(self):
        'Return state information for pickling.'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __setitem__(self, index, value):
        'x.__setitem__(i, y) <==> x[i]=y'
        pass
    def __sizeof__(self):
        'B.__sizeof__() -> int\n \nReturns the size of B in memory, in bytes'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def append(self):
        'B.append(int) -> None\n\nAppend a single item to the end of B.'
        pass
    def capitalize(self):
        'B.capitalize() -> copy of B\n\nReturn a copy of B with only its first character capitalized (ASCII).'
        pass
    def center(self):
        'B.center(width[, fillchar]) -> copy of B\n\nReturn B centered in a string of length width.  Padding is\ndone using the specified fill character (default is a space).'
        pass
    def count(self, x):
        'B.count(sub [,start [,end]]) -> int\n\nReturn the number of non-overlapping occurrences of subsection sub in\nbytes B[start:end].  Optional arguments start and end are interpreted\nas in slice notation.'
        pass
    def decode(self):
        "B.decode([encoding[, errors]]) -> unicode object.\n\nDecodes B using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme.  Default is 'strict' meaning that encoding errors raise\na UnicodeDecodeError.  Other possible values are 'ignore' and 'replace'\nas well as any other name registered with codecs.register_error that is\nable to handle UnicodeDecodeErrors."
        pass
    def endswith(self, suffix, start=0, end=-1):
        'B.endswith(suffix [,start [,end]]) -> bool\n\nReturn True if B ends with the specified suffix, False otherwise.\nWith optional start, test B beginning at that position.\nWith optional end, stop comparing B at that position.\nsuffix can also be a tuple of strings to try.'
        pass
    def expandtabs(self, tabsize=8):
        'B.expandtabs([tabsize]) -> copy of B\n\nReturn a copy of B where all tab characters are expanded using spaces.\nIf tabsize is not given, a tab size of 8 characters is assumed.'
        pass
    def extend(self):
        'B.extend(iterable int) -> None\n\nAppend all the elements from the iterator or sequence to the\nend of B.'
        pass
    def find(self, sub, start=0, end=-1):
        'B.find(sub [,start [,end]]) -> int\n\nReturn the lowest index in B where subsection sub is found,\nsuch that sub is contained within s[start,end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def fromhex(self):
        "bytearray.fromhex(string) -> bytearray\n\nCreate a bytearray object from a string of hexadecimal numbers.\nSpaces between two numbers are accepted.\nExample: bytearray.fromhex('B9 01EF') -> bytearray(b'\\xb9\\x01\\xef')."
        pass
    def index(self, v):
        'B.index(sub [,start [,end]]) -> int\n\nLike B.find() but raise ValueError when the subsection is not found.'
        pass
    def insert(self):
        'B.insert(index, int) -> None\n\nInsert a single item into the bytearray before the given index.'
        pass
    def isalnum(self):
        'B.isalnum() -> bool\n\nReturn True if all characters in B are alphanumeric\nand there is at least one character in B, False otherwise.'
        pass
    def isalpha(self):
        'B.isalpha() -> bool\n\nReturn True if all characters in B are alphabetic\nand there is at least one character in B, False otherwise.'
        pass
    def isdigit(self):
        'B.isdigit() -> bool\n\nReturn True if all characters in B are digits\nand there is at least one character in B, False otherwise.'
        pass
    def islower(self):
        'B.islower() -> bool\n\nReturn True if all cased characters in B are lowercase and there is\nat least one cased character in B, False otherwise.'
        pass
    def isspace(self):
        'B.isspace() -> bool\n\nReturn True if all characters in B are whitespace\nand there is at least one character in B, False otherwise.'
        pass
    def istitle(self):
        'B.istitle() -> bool\n\nReturn True if B is a titlecased string and there is at least one\ncharacter in B, i.e. uppercase characters may only follow uncased\ncharacters and lowercase characters only cased ones. Return False\notherwise.'
        pass
    def isupper(self):
        'B.isupper() -> bool\n\nReturn True if all cased characters in B are uppercase and there is\nat least one cased character in B, False otherwise.'
        pass
    def join(self):
        'B.join(iterable_of_bytes) -> bytes\n\nConcatenates any number of bytearray objects, with B in between each pair.'
        pass
    def ljust(self):
        'B.ljust(width[, fillchar]) -> copy of B\n\nReturn B left justified in a string of length width. Padding is\ndone using the specified fill character (default is a space).'
        pass
    def lower(self):
        'B.lower() -> copy of B\n\nReturn a copy of B with all ASCII characters converted to lowercase.'
        pass
    def lstrip(self, chars):
        'B.lstrip([bytes]) -> bytearray\n\nStrip leading bytes contained in the argument.\nIf the argument is omitted, strip leading ASCII whitespace.'
        pass
    def partition(self):
        'B.partition(sep) -> (head, sep, tail)\n\nSearches for the separator sep in B, and returns the part before it,\nthe separator itself, and the part after it.  If the separator is not\nfound, returns B and two empty bytearray objects.'
        pass
    def pop(self):
        'B.pop([index]) -> int\n\nRemove and return a single item from B. If no index\nargument is given, will pop the last value.'
        pass
    def remove(self):
        'B.remove(int) -> None\n\nRemove the first occurance of a value in B.'
        pass
    def replace(self, old, new, count=-1):
        'B.replace(old, new[, count]) -> bytes\n\nReturn a copy of B with all occurrences of subsection\nold replaced by new.  If the optional argument count is\ngiven, only the first count occurrences are replaced.'
        pass
    def reverse(self):
        'B.reverse() -> None\n\nReverse the order of the values in B in place.'
        pass
    def rfind(self, sub, start=0, end=-1):
        'B.rfind(sub [,start [,end]]) -> int\n\nReturn the highest index in B where subsection sub is found,\nsuch that sub is contained within s[start,end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def rindex(self, sub, start=0, end=-1):
        'B.rindex(sub [,start [,end]]) -> int\n\nLike B.rfind() but raise ValueError when the subsection is not found.'
        pass
    def rjust(self):
        'B.rjust(width[, fillchar]) -> copy of B\n\nReturn B right justified in a string of length width. Padding is\ndone using the specified fill character (default is a space)'
        pass
    def rpartition(self):
        'B.rpartition(sep) -> (head, sep, tail)\n\nSearches for the separator sep in B, starting at the end of B,\nand returns the part before it, the separator itself, and the\npart after it.  If the separator is not found, returns two empty\nbytearray objects and B.'
        pass
    def rsplit(self, sep=None, maxsplit=-1):
        'B.rsplit(sep[, maxsplit]) -> list of bytearray\n\nReturn a list of the sections in B, using sep as the delimiter,\nstarting at the end of B and working to the front.\nIf sep is not given, B is split on ASCII whitespace characters\n(space, tab, return, newline, formfeed, vertical tab).\nIf maxsplit is given, at most maxsplit splits are done.'
        pass
    def rstrip(self, chars=None):
        'B.rstrip([bytes]) -> bytearray\n\nStrip trailing bytes contained in the argument.\nIf the argument is omitted, strip trailing ASCII whitespace.'
        pass
    def split(self, sep=None, maxsplit=-1):
        'B.split([sep[, maxsplit]]) -> list of bytearray\n\nReturn a list of the sections in B, using sep as the delimiter.\nIf sep is not given, B is split on ASCII whitespace characters\n(space, tab, return, newline, formfeed, vertical tab).\nIf maxsplit is given, at most maxsplit splits are done.'
        pass
    def splitlines(self, keepends=False):
        'B.splitlines([keepends]) -> list of lines\n\nReturn a list of the lines in B, breaking at line boundaries.\nLine breaks are not included in the resulting list unless keepends\nis given and true.'
        pass
    def startswith(self, prefix, start=0, end=-1):
        'B.startswith(prefix [,start [,end]]) -> bool\n\nReturn True if B starts with the specified prefix, False otherwise.\nWith optional start, test B beginning at that position.\nWith optional end, stop comparing B at that position.\nprefix can also be a tuple of strings to try.'
        pass
    def strip(self, chars=None):
        'B.strip([bytes]) -> bytearray\n\nStrip leading and trailing bytes contained in the argument.\nIf the argument is omitted, strip ASCII whitespace.'
        pass
    def swapcase(self):
        'B.swapcase() -> copy of B\n\nReturn a copy of B with uppercase ASCII characters converted\nto lowercase ASCII and vice versa.'
        pass
    def title(self):
        'B.title() -> copy of B\n\nReturn a titlecased version of B, i.e. ASCII words start with uppercase\ncharacters, all remaining cased characters have lowercase.'
        pass
    def translate(self):
        'B.translate(table[, deletechars]) -> bytearray\n\nReturn a copy of B, where all characters occurring in the\noptional argument deletechars are removed, and the remaining\ncharacters have been mapped through the given translation\ntable, which must be a bytes object of length 256.'
        pass
    def upper(self):
        'B.upper() -> copy of B\n\nReturn a copy of B with all ASCII characters converted to uppercase.'
        pass
    def zfill(self, width):
        'B.zfill(width) -> copy of B\n\nPad a numeric string B with zeros on the left, to fill a field\nof the specified width.  B is never truncated.'
        pass
class bytes(basestring):
    'str(object) -> string\n\nReturn a nice string representation of the object.\nIf the argument is a string, the return value is the same object.'
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = str
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __format__(self, format_spec):
        'S.__format__(format_spec) -> unicode\n\n'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getnewargs__(self):
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __sizeof__(self):
        'S.__sizeof__() -> size of S in memory, in bytes'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def _formatter_field_name_split(self):
        pass
    def _formatter_parser(self):
        pass
    def capitalize(self):
        'S.capitalize() -> string\n\nReturn a copy of the string S with only its first character\ncapitalized.'
        pass
    def center(self):
        'S.center(width[, fillchar]) -> string\n\nReturn S centered in a string of length width. Padding is\ndone using the specified fill character (default is a space)'
        pass
    def count(self, x):
        'S.count(sub[, start[, end]]) -> int\n\nReturn the number of non-overlapping occurrences of substring sub in\nstring S[start:end].  Optional arguments start and end are interpreted\nas in slice notation.'
        pass
    def decode(self):
        "S.decode([encoding[,errors]]) -> object\n\nDecodes S using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme. Default is 'strict' meaning that encoding errors raise\na UnicodeDecodeError. Other possible values are 'ignore' and 'replace'\nas well as any other name registered with codecs.register_error that is\nable to handle UnicodeDecodeErrors."
        pass
    def encode(self):
        "S.encode([encoding[,errors]]) -> object\n\nEncodes S using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme. Default is 'strict' meaning that encoding errors raise\na UnicodeEncodeError. Other possible values are 'ignore', 'replace' and\n'xmlcharrefreplace' as well as any other name registered with\ncodecs.register_error that is able to handle UnicodeEncodeErrors."
        pass
    def endswith(self, suffix, start=0, end=-1):
        'S.endswith(suffix[, start[, end]]) -> bool\n\nReturn True if S ends with the specified suffix, False otherwise.\nWith optional start, test S beginning at that position.\nWith optional end, stop comparing S at that position.\nsuffix can also be a tuple of strings to try.'
        pass
    def expandtabs(self, tabsize=8):
        'S.expandtabs([tabsize]) -> string\n\nReturn a copy of S where all tab characters are expanded using spaces.\nIf tabsize is not given, a tab size of 8 characters is assumed.'
        pass
    def find(self, sub, start=0, end=-1):
        'S.find(sub [,start [,end]]) -> int\n\nReturn the lowest index in S where substring sub is found,\nsuch that sub is contained within s[start:end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def format(self):
        'S.format(*args, **kwargs) -> unicode\n\n'
        pass
    def index(self, v):
        'S.index(sub [,start [,end]]) -> int\n\nLike S.find() but raise ValueError when the substring is not found.'
        pass
    def isalnum(self):
        'S.isalnum() -> bool\n\nReturn True if all characters in S are alphanumeric\nand there is at least one character in S, False otherwise.'
        pass
    def isalpha(self):
        'S.isalpha() -> bool\n\nReturn True if all characters in S are alphabetic\nand there is at least one character in S, False otherwise.'
        pass
    def isdigit(self):
        'S.isdigit() -> bool\n\nReturn True if all characters in S are digits\nand there is at least one character in S, False otherwise.'
        pass
    def islower(self):
        'S.islower() -> bool\n\nReturn True if all cased characters in S are lowercase and there is\nat least one cased character in S, False otherwise.'
        pass
    def isspace(self):
        'S.isspace() -> bool\n\nReturn True if all characters in S are whitespace\nand there is at least one character in S, False otherwise.'
        pass
    def istitle(self):
        'S.istitle() -> bool\n\nReturn True if S is a titlecased string and there is at least one\ncharacter in S, i.e. uppercase characters may only follow uncased\ncharacters and lowercase characters only cased ones. Return False\notherwise.'
        pass
    def isupper(self):
        'S.isupper() -> bool\n\nReturn True if all cased characters in S are uppercase and there is\nat least one cased character in S, False otherwise.'
        pass
    def join(self):
        'S.join(iterable) -> string\n\nReturn a string which is the concatenation of the strings in the\niterable.  The separator between elements is S.'
        pass
    def ljust(self):
        'S.ljust(width[, fillchar]) -> string\n\nReturn S left-justified in a string of length width. Padding is\ndone using the specified fill character (default is a space).'
        pass
    def lower(self):
        'S.lower() -> string\n\nReturn a copy of the string S converted to lowercase.'
        pass
    def lstrip(self, chars):
        'S.lstrip([chars]) -> string or unicode\n\nReturn a copy of the string S with leading whitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is unicode, S will be converted to unicode before stripping'
        pass
    def partition(self):
        'S.partition(sep) -> (head, sep, tail)\n\nSearch for the separator sep in S, and return the part before it,\nthe separator itself, and the part after it.  If the separator is not\nfound, return S and two empty strings.'
        pass
    def replace(self, old, new, count=-1):
        'S.replace(old, new[, count]) -> string\n\nReturn a copy of string S with all occurrences of substring\nold replaced by new.  If the optional argument count is\ngiven, only the first count occurrences are replaced.'
        pass
    def rfind(self, sub, start=0, end=-1):
        'S.rfind(sub [,start [,end]]) -> int\n\nReturn the highest index in S where substring sub is found,\nsuch that sub is contained within s[start:end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def rindex(self, sub, start=0, end=-1):
        'S.rindex(sub [,start [,end]]) -> int\n\nLike S.rfind() but raise ValueError when the substring is not found.'
        pass
    def rjust(self):
        'S.rjust(width[, fillchar]) -> string\n\nReturn S right-justified in a string of length width. Padding is\ndone using the specified fill character (default is a space)'
        pass
    def rpartition(self):
        'S.rpartition(sep) -> (head, sep, tail)\n\nSearch for the separator sep in S, starting at the end of S, and return\nthe part before it, the separator itself, and the part after it.  If the\nseparator is not found, return two empty strings and S.'
        pass
    def rsplit(self, sep=None, maxsplit=-1):
        'S.rsplit([sep [,maxsplit]]) -> list of strings\n\nReturn a list of the words in the string S, using sep as the\ndelimiter string, starting at the end of the string and working\nto the front.  If maxsplit is given, at most maxsplit splits are\ndone. If sep is not specified or is None, any whitespace string\nis a separator.'
        pass
    def rstrip(self, chars=None):
        'S.rstrip([chars]) -> string or unicode\n\nReturn a copy of the string S with trailing whitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is unicode, S will be converted to unicode before stripping'
        pass
    def split(self, sep=None, maxsplit=-1):
        'S.split([sep [,maxsplit]]) -> list of strings\n\nReturn a list of the words in the string S, using sep as the\ndelimiter string.  If maxsplit is given, at most maxsplit\nsplits are done. If sep is not specified or is None, any\nwhitespace string is a separator and empty strings are removed\nfrom the result.'
        pass
    def splitlines(self, keepends=False):
        'S.splitlines([keepends]) -> list of strings\n\nReturn a list of the lines in S, breaking at line boundaries.\nLine breaks are not included in the resulting list unless keepends\nis given and true.'
        pass
    def startswith(self, prefix, start=0, end=-1):
        'S.startswith(prefix[, start[, end]]) -> bool\n\nReturn True if S starts with the specified prefix, False otherwise.\nWith optional start, test S beginning at that position.\nWith optional end, stop comparing S at that position.\nprefix can also be a tuple of strings to try.'
        pass
    def strip(self, chars=None):
        'S.strip([chars]) -> string or unicode\n\nReturn a copy of the string S with leading and trailing\nwhitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is unicode, S will be converted to unicode before stripping'
        pass
    def swapcase(self):
        'S.swapcase() -> string\n\nReturn a copy of the string S with uppercase characters\nconverted to lowercase and vice versa.'
        pass
    def title(self):
        'S.title() -> string\n\nReturn a titlecased version of S, i.e. words start with uppercase\ncharacters, all remaining cased characters have lowercase.'
        pass
    def translate(self):
        'S.translate(table [,deletechars]) -> string\n\nReturn a copy of the string S, where all characters occurring\nin the optional argument deletechars are removed, and the\nremaining characters have been mapped through the given\ntranslation table, which must be a string of length 256.'
        pass
    def upper(self):
        'S.upper() -> string\n\nReturn a copy of the string S converted to uppercase.'
        pass
    def zfill(self, width):
        'S.zfill(width) -> string\n\nPad a numeric string S with zeros on the left, to fill a field\nof the specified width.  The string S is never truncated.'
        pass
def callable(object):
    'callable(object) -> bool\n\nReturn whether the object is callable (i.e., some kind of function).\nNote that classes are callable, as are instances with a __call__() method.'
    pass
def chr(i):
    'chr(i) -> character\n\nReturn a string of one character with ordinal i; 0 <= i < 256.'
    pass
class classmethod(object):
    'classmethod(function) -> method\n\nConvert a function to be a class method.\n\nA class method receives the class as implicit first argument,\njust like an instance method receives the instance.\nTo declare a class method, use this idiom:\n\n  class C:\n      def f(cls, arg1, arg2, ...): ...\n      f = classmethod(f)\n\nIt can be called either on the class (e.g. C.f()) or on an instance\n(e.g. C().f()).  The instance is ignored except for its class.\nIf a class method is called for a derived class, the derived class\nobject is passed as the implied first argument.\n\nClass methods are different than C++ or Java static methods.\nIf you want those, see the staticmethod builtin.'
    __class__ = classmethod
    __func__ = member_descriptor()
    def __get__(self):
        'descr.__get__(obj[, type]) -> value'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
def cmp(x, y):
    'cmp(x, y) -> integer\n\nReturn negative if x<y, zero if x==y, positive if x>y.'
    pass
def coerce(x, y):
    'coerce(x, y) -> (x1, y1)\n\nReturn a tuple consisting of the two numeric arguments converted to\na common type, using the same rules as used by arithmetic operations.\nIf coercion is not possible, raise TypeError.'
    pass
def compile(source, filename, mode, flags, dont_inherit):
    "compile(source, filename, mode[, flags[, dont_inherit]]) -> code object\n\nCompile the source string (a Python module, statement or expression)\ninto a code object that can be executed by the exec statement or eval().\nThe filename will be used for run-time error messages.\nThe mode must be 'exec' to compile a module, 'single' to compile a\nsingle (interactive) statement, or 'eval' to compile an expression.\nThe flags argument, if present, controls which future statements influence\nthe compilation of the code.\nThe dont_inherit argument, if non-zero, stops the compilation inheriting\nthe effects of any future statements in effect in the code calling\ncompile; if absent or zero these statements do influence the compilation,\nin addition to any features explicitly specified."
    pass
class complex(object):
    'complex(real[, imag]) -> complex number\n\nCreate a complex number from a real part and an optional imaginary part.\nThis is equivalent to (real + imag*1j) where imag defaults to 0.'
    def __abs__(self):
        'x.__abs__() <==> abs(x)'
        pass
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = complex
    def __coerce__(self):
        'x.__coerce__(y) <==> coerce(x, y)'
        pass
    def __div__(self):
        'x.__div__(y) <==> x/y'
        pass
    def __divmod__(self):
        'x.__divmod__(y) <==> divmod(x, y)'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __float__(self):
        'x.__float__() <==> float(x)'
        pass
    def __floordiv__(self):
        'x.__floordiv__(y) <==> x//y'
        pass
    def __format__(self, format_spec):
        'complex.__format__() -> str\n\nConverts to a string according to format_spec.'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getnewargs__(self):
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __int__(self):
        'x.__int__() <==> int(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __long__(self):
        'x.__long__() <==> long(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(y) <==> x*y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __neg__(self):
        'x.__neg__() <==> -x'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __nonzero__(self):
        'x.__nonzero__() <==> x != 0'
        pass
    def __pos__(self):
        'x.__pos__() <==> +x'
        pass
    def __pow__(self):
        'x.__pow__(y[, z]) <==> pow(x, y[, z])'
        pass
    def __radd__(self):
        'x.__radd__(y) <==> y+x'
        pass
    def __rdiv__(self):
        'x.__rdiv__(y) <==> y/x'
        pass
    def __rdivmod__(self):
        'x.__rdivmod__(y) <==> divmod(y, x)'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rfloordiv__(self):
        'x.__rfloordiv__(y) <==> y//x'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(y) <==> y*x'
        pass
    def __rpow__(self):
        'y.__rpow__(x[, z]) <==> pow(x, y[, z])'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rtruediv__(self):
        'x.__rtruediv__(y) <==> y/x'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __truediv__(self):
        'x.__truediv__(y) <==> x/y'
        pass
    def conjugate(self):
        'complex.conjugate() -> complex\n\nReturns the complex conjugate of its argument. (3-4j).conjugate() == 3+4j.'
        pass
    imag = member_descriptor()
    real = member_descriptor()
def copyright():
    'interactive prompt objects for printing the license text, a list of\n    contributors and the copyright notice.'
    pass
def credits():
    'interactive prompt objects for printing the license text, a list of\n    contributors and the copyright notice.'
    pass
def delattr(object, name):
    "delattr(object, name)\n\nDelete a named attribute on an object; delattr(x, 'y') is equivalent to\n``del x.y''."
    pass
class dict(object):
    "dict() -> new empty dictionary\ndict(mapping) -> new dictionary initialized from a mapping object's\n    (key, value) pairs\ndict(iterable) -> new dictionary initialized as if via:\n    d = {}\n    for k, v in iterable:\n        d[k] = v\ndict(**kwargs) -> new dictionary initialized with the name=value pairs\n    in the keyword argument list.  For example:  dict(one=1, two=2)"
    __class__ = dict
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __contains__(self, value):
        'D.__contains__(k) -> True if D has a key k, else False'
        pass
    def __delitem__(self):
        'x.__delitem__(y) <==> del x[y]'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    __hash__
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setitem__(self, index, value):
        'x.__setitem__(i, y) <==> x[i]=y'
        pass
    def __sizeof__(self):
        'D.__sizeof__() -> size of D in memory, in bytes'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def clear(self):
        'D.clear() -> None.  Remove all items from D.'
        pass
    def copy(self):
        'D.copy() -> a shallow copy of D'
        pass
    def fromkeys(self):
        'dict.fromkeys(S[,v]) -> New dict with keys from S and values equal to v.\nv defaults to None.'
        pass
    def get(self):
        'D.get(k[,d]) -> D[k] if k in D, else d.  d defaults to None.'
        pass
    def has_key(self):
        'D.has_key(k) -> True if D has a key k, else False'
        pass
    def items(self):
        "D.items() -> list of D's (key, value) pairs, as 2-tuples"
        pass
    def iteritems(self):
        'D.iteritems() -> an iterator over the (key, value) items of D'
        pass
    def iterkeys(self):
        'D.iterkeys() -> an iterator over the keys of D'
        pass
    def itervalues(self):
        'D.itervalues() -> an iterator over the values of D'
        pass
    def keys(self):
        "D.keys() -> list of D's keys"
        pass
    def pop(self):
        'D.pop(k[,d]) -> v, remove specified key and return the corresponding value.\nIf key is not found, d is returned if given, otherwise KeyError is raised'
        pass
    def popitem(self):
        'D.popitem() -> (k, v), remove and return some (key, value) pair as a\n2-tuple; but raise KeyError if D is empty.'
        pass
    def setdefault(self):
        'D.setdefault(k[,d]) -> D.get(k,d), also set D[k]=d if k not in D'
        pass
    def update(self):
        'D.update(E, **F) -> None.  Update D from dict/iterable E and F.\nIf E has a .keys() method, does:     for k in E: D[k] = E[k]\nIf E lacks .keys() method, does:     for (k, v) in E: D[k] = v\nIn either case, this is followed by: for k in F: D[k] = F[k]'
        pass
    def values(self):
        "D.values() -> list of D's values"
        pass
    def viewitems(self):
        "D.viewitems() -> a set-like object providing a view on D's items"
        pass
    def viewkeys(self):
        "D.viewkeys() -> a set-like object providing a view on D's keys"
        pass
    def viewvalues(self):
        "D.viewvalues() -> an object providing a view on D's values"
        pass
def dir(object):
    "dir([object]) -> list of strings\n\nIf called without an argument, return the names in the current scope.\nElse, return an alphabetized list of names comprising (some of) the attributes\nof the given object, and of attributes reachable from it.\nIf the object supplies a method named __dir__, it will be used; otherwise\nthe default dir() logic is used and returns:\n  for a module object: the module's attributes.\n  for a class object:  its attributes, and recursively the attributes\n    of its bases.\n  for any other object: its attributes, its class's attributes, and\n    recursively the attributes of its class's base classes."
    pass
def divmod(x, y):
    'divmod(x, y) -> (div, mod)\n\nReturn the tuple ((x-x%y)/y, x%y).  Invariant: div*y + mod == x.'
    pass
class enumerate(object):
    'enumerate(iterable[, start]) -> iterator for index, value of iterable\n\nReturn an enumerate object.  iterable must be another object that supports\niteration.  The enumerate object yields pairs containing a count (from\nstart, which defaults to zero) and a value yielded by the iterable argument.\nenumerate is useful for obtaining an indexed list:\n    (0, seq[0]), (1, seq[1]), (2, seq[2]), ...'
    __class__ = enumerate
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def next(self):
        'x.next() -> the next value, or raise StopIteration'
        pass
def eval(source, globals, locals):
    'eval(source[, globals[, locals]]) -> value\n\nEvaluate the source in the context of globals and locals.\nThe source may be a string representing a Python expression\nor a code object as returned by compile().\nThe globals must be a dictionary and locals can be any mapping,\ndefaulting to the current globals and locals.\nIf only globals is given, locals defaults to it.\n'
    pass
def execfile(filename, globals, locals):
    'execfile(filename[, globals[, locals]])\n\nRead and execute a Python script from a file.\nThe globals and locals are dictionaries, defaulting to the current\nglobals and locals.  If only globals is given, locals defaults to it.'
    pass
def exit():
    pass
class file(object):
    "file(name[, mode[, buffering]]) -> file object\n\nOpen a file.  The mode can be 'r', 'w' or 'a' for reading (default),\nwriting or appending.  The file will be created if it doesn't exist\nwhen opened for writing or appending; it will be truncated when\nopened for writing.  Add a 'b' to the mode for binary files.\nAdd a '+' to the mode to allow simultaneous reading and writing.\nIf the buffering argument is given, 0 means unbuffered, 1 means line\nbuffered, and larger numbers specify the buffer size.  The preferred way\nto open a file is with the builtin open() function.\nAdd a 'U' to mode to open the file for input with universal newline\nsupport.  Any line ending in the input file will be seen as a '\\n'\nin Python.  Also, a file so opened gains the attribute 'newlines';\nthe value for this attribute is one of None (no newline read yet),\n'\\r', '\\n', '\\r\\n' or a tuple containing all the newline types seen.\n\n'U' cannot be combined with 'w' or '+' mode.\n"
    __class__ = file
    def __delattr__(self):
        "x.__delattr__('name') <==> del x.name"
        pass
    def __enter__():
        '__enter__() -> self.'
        pass
    def __exit__():
        '__exit__(*excinfo) -> None.  Closes the file.'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setattr__(self):
        "x.__setattr__('name', value) <==> x.name = value"
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def close():
        'close() -> None or (perhaps) an integer.  Close the file.\n\nSets data attribute .closed to True.  A closed file cannot be used for\nfurther I/O operations.  close() may be called more than once without\nerror.  Some kinds of file objects (for example, opened by popen())\nmay return an exit status upon closing.'
        pass
    closed = getset_descriptor()
    encoding = member_descriptor()
    errors = member_descriptor()
    def fileno():
        'fileno() -> integer "file descriptor".\n\nThis is needed for lower-level file interfaces, such os.read().'
        pass
    def flush():
        'flush() -> None.  Flush the internal I/O buffer.'
        pass
    def isatty():
        'isatty() -> true or false.  True if the file is connected to a tty device.'
        pass
    mode = member_descriptor()
    name = member_descriptor()
    newlines = getset_descriptor()
    def next(self):
        'x.next() -> the next value, or raise StopIteration'
        pass
    def read(size):
        'read([size]) -> read at most size bytes, returned as a string.\n\nIf the size argument is negative or omitted, read until EOF is reached.\nNotice that when in non-blocking mode, less data than what was requested\nmay be returned, even if no size parameter was given.'
        pass
    def readinto():
        "readinto() -> Undocumented.  Don't use this; it may go away."
        pass
    def readline(size):
        'readline([size]) -> next line from the file, as a string.\n\nRetain newline.  A non-negative size argument limits the maximum\nnumber of bytes to return (an incomplete line may be returned then).\nReturn an empty string at EOF.'
        pass
    def readlines(size):
        'readlines([size]) -> list of strings, each a line from the file.\n\nCall readline() repeatedly and return a list of the lines so read.\nThe optional size argument, if given, is an approximate bound on the\ntotal number of bytes in the lines returned.'
        pass
    def seek(offset, whence):
        'seek(offset[, whence]) -> None.  Move to new file position.\n\nArgument offset is a byte count.  Optional argument whence defaults to\n0 (offset from start of file, offset should be >= 0); other values are 1\n(move relative to current position, positive or negative), and 2 (move\nrelative to end of file, usually negative, although many platforms allow\nseeking beyond the end of a file).  If the file is opened in text mode,\nonly offsets returned by tell() are legal.  Use of other offsets causes\nundefined behavior.\nNote that not all file objects are seekable.'
        pass
    softspace = getset_descriptor()
    def tell():
        'tell() -> current file position, an integer (may be a long integer).'
        pass
    def truncate(size):
        'truncate([size]) -> None.  Truncate the file to at most size bytes.\n\nSize defaults to the current file position, as returned by tell().'
        pass
    def write(str):
        'write(str) -> None.  Write string str to file.\n\nNote that due to buffering, flush() or close() may be needed before\nthe file on disk reflects the data written.'
        pass
    def writelines(sequence_of_strings):
        'writelines(sequence_of_strings) -> None.  Write the strings to the file.\n\nNote that newlines are not added.  The sequence can be any iterable object\nproducing strings. This is equivalent to calling write() for each string.'
        pass
    def xreadlines():
        'xreadlines() -> returns self.\n\nFor backward compatibility. File objects now include the performance\noptimizations previously implemented in the xreadlines module.'
        pass
def filter():
    'filter(function or None, sequence) -> list, tuple, or string\n\nReturn those items of sequence for which function(item) is true.  If\nfunction is None, return the items that are true.  If sequence is a tuple\nor string, return the same type, else return a list.'
    pass
class float(object):
    'float(x) -> floating point number\n\nConvert a string or number to a floating point number, if possible.'
    def __abs__(self):
        'x.__abs__() <==> abs(x)'
        pass
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = float
    def __coerce__(self):
        'x.__coerce__(y) <==> coerce(x, y)'
        pass
    def __div__(self):
        'x.__div__(y) <==> x/y'
        pass
    def __divmod__(self):
        'x.__divmod__(y) <==> divmod(x, y)'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __float__(self):
        'x.__float__() <==> float(x)'
        pass
    def __floordiv__(self):
        'x.__floordiv__(y) <==> x//y'
        pass
    def __format__(self, format_spec):
        'float.__format__(format_spec) -> string\n\nFormats the float according to format_spec.'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getformat__(self):
        "float.__getformat__(typestr) -> string\n\nYou probably don't want to use this function.  It exists mainly to be\nused in Python's test suite.\n\ntypestr must be 'double' or 'float'.  This function returns whichever of\n'unknown', 'IEEE, big-endian' or 'IEEE, little-endian' best describes the\nformat of floating point numbers used by the C type named by typestr."
        pass
    def __getnewargs__(self):
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __int__(self):
        'x.__int__() <==> int(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __long__(self):
        'x.__long__() <==> long(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(y) <==> x*y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __neg__(self):
        'x.__neg__() <==> -x'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __nonzero__(self):
        'x.__nonzero__() <==> x != 0'
        pass
    def __pos__(self):
        'x.__pos__() <==> +x'
        pass
    def __pow__(self):
        'x.__pow__(y[, z]) <==> pow(x, y[, z])'
        pass
    def __radd__(self):
        'x.__radd__(y) <==> y+x'
        pass
    def __rdiv__(self):
        'x.__rdiv__(y) <==> y/x'
        pass
    def __rdivmod__(self):
        'x.__rdivmod__(y) <==> divmod(y, x)'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rfloordiv__(self):
        'x.__rfloordiv__(y) <==> y//x'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(y) <==> y*x'
        pass
    def __rpow__(self):
        'y.__rpow__(x[, z]) <==> pow(x, y[, z])'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rtruediv__(self):
        'x.__rtruediv__(y) <==> y/x'
        pass
    def __setformat__(self):
        "float.__setformat__(typestr, fmt) -> None\n\nYou probably don't want to use this function.  It exists mainly to be\nused in Python's test suite.\n\ntypestr must be 'double' or 'float'.  fmt must be one of 'unknown',\n'IEEE, big-endian' or 'IEEE, little-endian', and in addition can only be\none of the latter two if it appears to match the underlying C reality.\n\nOverrides the automatic determination of C-level floating point type.\nThis affects how floats are converted to and from binary strings."
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __truediv__(self):
        'x.__truediv__(y) <==> x/y'
        pass
    def __trunc__(self):
        'Returns the Integral closest to x between 0 and x.'
        pass
    def as_integer_ratio(self):
        'float.as_integer_ratio() -> (int, int)\n\nReturns a pair of integers, whose ratio is exactly equal to the original\nfloat and with a positive denominator.\nRaises OverflowError on infinities and a ValueError on NaNs.\n\n>>> (10.0).as_integer_ratio()\n(10, 1)\n>>> (0.0).as_integer_ratio()\n(0, 1)\n>>> (-.25).as_integer_ratio()\n(-1, 4)'
        pass
    def conjugate(self):
        'Returns self, the complex conjugate of any float.'
        pass
    def fromhex(self):
        "float.fromhex(string) -> float\n\nCreate a floating-point number from a hexadecimal string.\n>>> float.fromhex('0x1.ffffp10')\n2047.984375\n>>> float.fromhex('-0x1p-1074')\n-4.9406564584124654e-324"
        pass
    def hex(self):
        "float.hex() -> string\n\nReturn a hexadecimal representation of a floating-point number.\n>>> (-0.1).hex()\n'-0x1.999999999999ap-4'\n>>> 3.14159.hex()\n'0x1.921f9f01b866ep+1'"
        pass
    imag = getset_descriptor()
    def is_integer(self):
        'Returns True if the float is an integer.'
        pass
    real = getset_descriptor()
def format(value, format_spec):
    'format(value[, format_spec]) -> string\n\nReturns value.__format__(format_spec)\nformat_spec defaults to ""'
    pass
class frozenset(object):
    'frozenset() -> empty frozenset object\nfrozenset(iterable) -> frozenset object\n\nBuild an immutable unordered collection of unique elements.'
    def __and__(self):
        'x.__and__(y) <==> x&y'
        pass
    __class__ = frozenset
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x.'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __or__(self):
        'x.__or__(y) <==> x|y'
        pass
    def __rand__(self):
        'x.__rand__(y) <==> y&x'
        pass
    def __reduce__(self):
        'Return state information for pickling.'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __ror__(self):
        'x.__ror__(y) <==> y|x'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rxor__(self):
        'x.__rxor__(y) <==> y^x'
        pass
    def __sizeof__(self):
        'S.__sizeof__() -> size of S in memory, in bytes'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __xor__(self):
        'x.__xor__(y) <==> x^y'
        pass
    def copy(self):
        'Return a shallow copy of a set.'
        pass
    def difference(self):
        'Return the difference of two or more sets as a new set.\n\n(i.e. all elements that are in this set but not the others.)'
        pass
    def intersection(self):
        'Return the intersection of two or more sets as a new set.\n\n(i.e. elements that are common to all of the sets.)'
        pass
    def isdisjoint(self):
        'Return True if two sets have a null intersection.'
        pass
    def issubset(self):
        'Report whether another set contains this set.'
        pass
    def issuperset(self):
        'Report whether this set contains another set.'
        pass
    def symmetric_difference(self):
        'Return the symmetric difference of two sets as a new set.\n\n(i.e. all elements that are in exactly one of the sets.)'
        pass
    def union(self):
        'Return the union of sets as a new set.\n\n(i.e. all elements that are in either set.)'
        pass
def getattr(object, name, default):
    "getattr(object, name[, default]) -> value\n\nGet a named attribute from an object; getattr(x, 'y') is equivalent to x.y.\nWhen a default argument is given, it is returned when the attribute doesn't\nexist; without it, an exception is raised in that case."
    pass
def globals():
    "globals() -> dictionary\n\nReturn the dictionary containing the current scope's global variables."
    pass
def hasattr(object, name):
    'hasattr(object, name) -> bool\n\nReturn whether the object has an attribute with the given name.\n(This is done by calling getattr(object, name) and catching exceptions.)'
    pass
def hash(object):
    'hash(object) -> integer\n\nReturn a hash value for the object.  Two objects with the same value have\nthe same hash value.  The reverse is not necessarily true, but likely.'
    pass
def help():
    "Define the built-in 'help'.\n    This is a wrapper around pydoc.help (with a twist).\n\n    "
    pass
def hex(number):
    'hex(number) -> string\n\nReturn the hexadecimal representation of an integer or long integer.'
    pass
def id(object):
    "id(object) -> integer\n\nReturn the identity of an object.  This is guaranteed to be unique among\nsimultaneously existing objects.  (Hint: it's the object's memory address.)"
    pass
def input(prompt):
    'input([prompt]) -> value\n\nEquivalent to eval(raw_input(prompt)).'
    pass
class int(object):
    'int(x[, base]) -> integer\n\nConvert a string or number to an integer, if possible.  A floating point\nargument will be truncated towards zero (this does not include a string\nrepresentation of a floating point number!)  When converting a string, use\nthe optional base.  It is an error to supply a base when converting a\nnon-string.  If base is zero, the proper base is guessed based on the\nstring content.  If the argument is outside the integer range a\nlong object will be returned instead.'
    def __abs__(self):
        'x.__abs__() <==> abs(x)'
        pass
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    def __and__(self):
        'x.__and__(y) <==> x&y'
        pass
    __class__ = int
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __coerce__(self):
        'x.__coerce__(y) <==> coerce(x, y)'
        pass
    def __div__(self):
        'x.__div__(y) <==> x/y'
        pass
    def __divmod__(self):
        'x.__divmod__(y) <==> divmod(x, y)'
        pass
    def __float__(self):
        'x.__float__() <==> float(x)'
        pass
    def __floordiv__(self):
        'x.__floordiv__(y) <==> x//y'
        pass
    def __format__(self, format_spec):
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getnewargs__(self):
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __hex__(self):
        'x.__hex__() <==> hex(x)'
        pass
    def __index__(self):
        'x[y:z] <==> x[y.__index__():z.__index__()]'
        pass
    def __int__(self):
        'x.__int__() <==> int(x)'
        pass
    def __invert__(self):
        'x.__invert__() <==> ~x'
        pass
    def __long__(self):
        'x.__long__() <==> long(x)'
        pass
    def __lshift__(self):
        'x.__lshift__(y) <==> x<<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(y) <==> x*y'
        pass
    def __neg__(self):
        'x.__neg__() <==> -x'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __nonzero__(self):
        'x.__nonzero__() <==> x != 0'
        pass
    def __oct__(self):
        'x.__oct__() <==> oct(x)'
        pass
    def __or__(self):
        'x.__or__(y) <==> x|y'
        pass
    def __pos__(self):
        'x.__pos__() <==> +x'
        pass
    def __pow__(self):
        'x.__pow__(y[, z]) <==> pow(x, y[, z])'
        pass
    def __radd__(self):
        'x.__radd__(y) <==> y+x'
        pass
    def __rand__(self):
        'x.__rand__(y) <==> y&x'
        pass
    def __rdiv__(self):
        'x.__rdiv__(y) <==> y/x'
        pass
    def __rdivmod__(self):
        'x.__rdivmod__(y) <==> divmod(y, x)'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rfloordiv__(self):
        'x.__rfloordiv__(y) <==> y//x'
        pass
    def __rlshift__(self):
        'x.__rlshift__(y) <==> y<<x'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(y) <==> y*x'
        pass
    def __ror__(self):
        'x.__ror__(y) <==> y|x'
        pass
    def __rpow__(self):
        'y.__rpow__(x[, z]) <==> pow(x, y[, z])'
        pass
    def __rrshift__(self):
        'x.__rrshift__(y) <==> y>>x'
        pass
    def __rshift__(self):
        'x.__rshift__(y) <==> x>>y'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rtruediv__(self):
        'x.__rtruediv__(y) <==> y/x'
        pass
    def __rxor__(self):
        'x.__rxor__(y) <==> y^x'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __truediv__(self):
        'x.__truediv__(y) <==> x/y'
        pass
    def __trunc__(self):
        'Truncating an Integral returns itself.'
        pass
    def __xor__(self):
        'x.__xor__(y) <==> x^y'
        pass
    def bit_length(self):
        "int.bit_length() -> int\n\nNumber of bits necessary to represent self in binary.\n>>> bin(37)\n'0b100101'\n>>> (37).bit_length()\n6"
        pass
    def conjugate(self):
        'Returns self, the complex conjugate of any int.'
        pass
    denominator = getset_descriptor()
    imag = getset_descriptor()
    numerator = getset_descriptor()
    real = getset_descriptor()
def intern(string):
    "intern(string) -> string\n\n``Intern'' the given string.  This enters the string in the (global)\ntable of interned strings whose purpose is to speed up dictionary lookups.\nReturn the string itself or the previously interned string object with the\nsame value."
    pass
def isinstance():
    "isinstance(object, class-or-type-or-tuple) -> bool\n\nReturn whether an object is an instance of a class or of a subclass thereof.\nWith a type as second argument, return whether that is the object's type.\nThe form using a tuple, isinstance(x, (A, B, ...)), is a shortcut for\nisinstance(x, A) or isinstance(x, B) or ... (etc.)."
    pass
def issubclass(C, B):
    'issubclass(C, B) -> bool\n\nReturn whether class C is a subclass (i.e., a derived class) of class B.\nWhen using a tuple as the second argument issubclass(X, (A, B, ...)),\nis a shortcut for issubclass(X, A) or issubclass(X, B) or ... (etc.).'
    pass
def iter(collection):
    'iter(collection) -> iterator\niter(callable, sentinel) -> iterator\n\nGet an iterator from an object.  In the first form, the argument must\nsupply its own iterator, or be a sequence.\nIn the second form, the callable is called until it returns the sentinel.'
    pass
def len(object):
    'len(object) -> integer\n\nReturn the number of items of a sequence or mapping.'
    pass
def license():
    'interactive prompt objects for printing the license text, a list of\n    contributors and the copyright notice.'
    pass
class list(object):
    "list() -> new empty list\nlist(iterable) -> new list initialized from iterable's items"
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = list
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __delitem__(self):
        'x.__delitem__(y) <==> del x[y]'
        pass
    def __delslice__(self):
        'x.__delslice__(i, j) <==> del x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    __hash__
    def __iadd__(self):
        'x.__iadd__(y) <==> x+=y'
        pass
    def __imul__(self):
        'x.__imul__(y) <==> x*=y'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __reversed__(self):
        'L.__reversed__() -- return a reverse iterator over the list'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __setitem__(self, index, value):
        'x.__setitem__(i, y) <==> x[i]=y'
        pass
    def __setslice__(self):
        'x.__setslice__(i, j, y) <==> x[i:j]=y\n           \n           Use  of negative indices is not supported.'
        pass
    def __sizeof__(self):
        'L.__sizeof__() -- size of L in memory, in bytes'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def append(self):
        'L.append(object) -- append object to end'
        pass
    def count(self, x):
        'L.count(value) -> integer -- return number of occurrences of value'
        pass
    def extend(self):
        'L.extend(iterable) -- extend list by appending elements from the iterable'
        pass
    def index(self, v):
        'L.index(value, [start, [stop]]) -> integer -- return first index of value.\nRaises ValueError if the value is not present.'
        pass
    def insert(self):
        'L.insert(index, object) -- insert object before index'
        pass
    def pop(self):
        'L.pop([index]) -> item -- remove and return item at index (default last).\nRaises IndexError if list is empty or index is out of range.'
        pass
    def remove(self):
        'L.remove(value) -- remove first occurrence of value.\nRaises ValueError if the value is not present.'
        pass
    def reverse(self):
        'L.reverse() -- reverse *IN PLACE*'
        pass
    def sort(self):
        'L.sort(cmp=None, key=None, reverse=False) -- stable sort *IN PLACE*;\ncmp(x, y) -> -1, 0, 1'
        pass
def locals():
    "locals() -> dictionary\n\nUpdate and return a dictionary containing the current scope's local variables."
    pass
class long(object):
    'long(x[, base]) -> integer\n\nConvert a string or number to a long integer, if possible.  A floating\npoint argument will be truncated towards zero (this does not include a\nstring representation of a floating point number!)  When converting a\nstring, use the optional base.  It is an error to supply a base when\nconverting a non-string.'
    def __abs__(self):
        'x.__abs__() <==> abs(x)'
        pass
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    def __and__(self):
        'x.__and__(y) <==> x&y'
        pass
    __class__ = long
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __coerce__(self):
        'x.__coerce__(y) <==> coerce(x, y)'
        pass
    def __div__(self):
        'x.__div__(y) <==> x/y'
        pass
    def __divmod__(self):
        'x.__divmod__(y) <==> divmod(x, y)'
        pass
    def __float__(self):
        'x.__float__() <==> float(x)'
        pass
    def __floordiv__(self):
        'x.__floordiv__(y) <==> x//y'
        pass
    def __format__(self, format_spec):
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getnewargs__(self):
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __hex__(self):
        'x.__hex__() <==> hex(x)'
        pass
    def __index__(self):
        'x[y:z] <==> x[y.__index__():z.__index__()]'
        pass
    def __int__(self):
        'x.__int__() <==> int(x)'
        pass
    def __invert__(self):
        'x.__invert__() <==> ~x'
        pass
    def __long__(self):
        'x.__long__() <==> long(x)'
        pass
    def __lshift__(self):
        'x.__lshift__(y) <==> x<<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(y) <==> x*y'
        pass
    def __neg__(self):
        'x.__neg__() <==> -x'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __nonzero__(self):
        'x.__nonzero__() <==> x != 0'
        pass
    def __oct__(self):
        'x.__oct__() <==> oct(x)'
        pass
    def __or__(self):
        'x.__or__(y) <==> x|y'
        pass
    def __pos__(self):
        'x.__pos__() <==> +x'
        pass
    def __pow__(self):
        'x.__pow__(y[, z]) <==> pow(x, y[, z])'
        pass
    def __radd__(self):
        'x.__radd__(y) <==> y+x'
        pass
    def __rand__(self):
        'x.__rand__(y) <==> y&x'
        pass
    def __rdiv__(self):
        'x.__rdiv__(y) <==> y/x'
        pass
    def __rdivmod__(self):
        'x.__rdivmod__(y) <==> divmod(y, x)'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rfloordiv__(self):
        'x.__rfloordiv__(y) <==> y//x'
        pass
    def __rlshift__(self):
        'x.__rlshift__(y) <==> y<<x'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(y) <==> y*x'
        pass
    def __ror__(self):
        'x.__ror__(y) <==> y|x'
        pass
    def __rpow__(self):
        'y.__rpow__(x[, z]) <==> pow(x, y[, z])'
        pass
    def __rrshift__(self):
        'x.__rrshift__(y) <==> y>>x'
        pass
    def __rshift__(self):
        'x.__rshift__(y) <==> x>>y'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rtruediv__(self):
        'x.__rtruediv__(y) <==> y/x'
        pass
    def __rxor__(self):
        'x.__rxor__(y) <==> y^x'
        pass
    def __sizeof__(self):
        'Returns size in memory, in bytes'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __truediv__(self):
        'x.__truediv__(y) <==> x/y'
        pass
    def __trunc__(self):
        'Truncating an Integral returns itself.'
        pass
    def __xor__(self):
        'x.__xor__(y) <==> x^y'
        pass
    def bit_length(self):
        "long.bit_length() -> int or long\n\nNumber of bits necessary to represent self in binary.\n>>> bin(37L)\n'0b100101'\n>>> (37L).bit_length()\n6"
        pass
    def conjugate(self):
        'Returns self, the complex conjugate of any long.'
        pass
    denominator = getset_descriptor()
    imag = getset_descriptor()
    numerator = getset_descriptor()
    real = getset_descriptor()
def map():
    'map(function, sequence[, sequence, ...]) -> list\n\nReturn a list of the results of applying the function to the items of\nthe argument sequence(s).  If more than one sequence is given, the\nfunction is called with an argument list consisting of the corresponding\nitem of each sequence, substituting None for missing values when not all\nsequences have the same length.  If the function is None, return a list of\nthe items of the sequence (or a list of tuples if more than one sequence).'
    pass
def max(iterable, key):
    'max(iterable[, key=func]) -> value\nmax(a, b, c, ...[, key=func]) -> value\n\nWith a single iterable argument, return its largest item.\nWith two or more arguments, return the largest argument.'
    pass
class memoryview(object):
    'memoryview(object)\n\nCreate a new memoryview object which references the given object.'
    __class__ = memoryview
    def __delitem__(self):
        'x.__delitem__(y) <==> del x[y]'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setitem__(self, index, value):
        'x.__setitem__(i, y) <==> x[i]=y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    format = getset_descriptor()
    itemsize = getset_descriptor()
    ndim = getset_descriptor()
    readonly = getset_descriptor()
    shape = getset_descriptor()
    strides = getset_descriptor()
    suboffsets = getset_descriptor()
    def tobytes(self):
        pass
    def tolist(self):
        pass
def min(iterable, key):
    'min(iterable[, key=func]) -> value\nmin(a, b, c, ...[, key=func]) -> value\n\nWith a single iterable argument, return its smallest item.\nWith two or more arguments, return the smallest argument.'
    pass
def next(iterator, default):
    'next(iterator[, default])\n\nReturn the next item from the iterator. If default is given and the iterator\nis exhausted, it is returned instead of raising StopIteration.'
    pass
class object:
    'The most base type'
    __class__ = object
    def __delattr__(self):
        "x.__delattr__('name') <==> del x.name"
        pass
    def __format__(self, format_spec):
        'default object formatter'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __reduce__(self):
        'helper for pickle'
        pass
    def __reduce_ex__(self, protocol):
        'helper for pickle'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setattr__(self):
        "x.__setattr__('name', value) <==> x.name = value"
        pass
    def __sizeof__():
        '__sizeof__() -> size of object in memory, in bytes'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
def oct(number):
    'oct(number) -> string\n\nReturn the octal representation of an integer or long integer.'
    pass
def open(name, mode, buffering):
    'open(name[, mode[, buffering]]) -> file object\n\nOpen a file using the file() type, returns a file object.  This is the\npreferred way to open a file.  See file.__doc__ for further information.'
    pass
def ord(c):
    'ord(c) -> integer\n\nReturn the integer ordinal of a one-character string.'
    pass
def pow(x, y, z):
    'pow(x, y[, z]) -> number\n\nWith two arguments, equivalent to x**y.  With three arguments,\nequivalent to (x**y) % z, but may be more efficient (e.g. for longs).'
    pass
class property(object):
    'property(fget=None, fset=None, fdel=None, doc=None) -> property attribute\n\nfget is a function to be used for getting an attribute value, and likewise\nfset is a function for setting, and fdel a function for del\'ing, an\nattribute.  Typical use is to define a managed attribute x:\nclass C(object):\n    def getx(self): return self._x\n    def setx(self, value): self._x = value\n    def delx(self): del self._x\n    x = property(getx, setx, delx, "I\'m the \'x\' property.")\n\nDecorators make defining new properties or modifying existing ones easy:\nclass C(object):\n    @property\n    def x(self): return self._x\n    @x.setter\n    def x(self, value): self._x = value\n    @x.deleter\n    def x(self): del self._x\n'
    __class__ = property
    def __delete__(self):
        'descr.__delete__(obj)'
        pass
    def __get__(self):
        'descr.__get__(obj[, type]) -> value'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __set__(self):
        'descr.__set__(obj, value)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def deleter(self):
        'Descriptor to change the deleter on a property.'
        pass
    fdel = member_descriptor()
    fget = member_descriptor()
    fset = member_descriptor()
    def getter(self):
        'Descriptor to change the getter on a property.'
        pass
    def setter(self):
        'Descriptor to change the setter on a property.'
        pass
def quit():
    pass
def range(start, stop, step):
    'range([start,] stop[, step]) -> list of integers\n\nReturn a list containing an arithmetic progression of integers.\nrange(i, j) returns [i, i+1, i+2, ..., j-1]; start (!) defaults to 0.\nWhen step is given, it specifies the increment (or decrement).\nFor example, range(4) returns [0, 1, 2, 3].  The end point is omitted!\nThese are exactly the valid indices for a list of 4 elements.'
    pass
def raw_input(prompt):
    'raw_input([prompt]) -> string\n\nRead a string from standard input.  The trailing newline is stripped.\nIf the user hits EOF (Unix: Ctl-D, Windows: Ctl-Z+Return), raise EOFError.\nOn Unix, GNU readline is used if enabled.  The prompt string, if given,\nis printed without a trailing newline before reading.'
    pass
def reduce(function, sequence, initial):
    'reduce(function, sequence[, initial]) -> value\n\nApply a function of two arguments cumulatively to the items of a sequence,\nfrom left to right, so as to reduce the sequence to a single value.\nFor example, reduce(lambda x, y: x+y, [1, 2, 3, 4, 5]) calculates\n((((1+2)+3)+4)+5).  If initial is present, it is placed before the items\nof the sequence in the calculation, and serves as a default when the\nsequence is empty.'
    pass
def reload(module):
    'reload(module) -> module\n\nReload the module.  The module must have been successfully imported before.'
    pass
def repr(object):
    'repr(object) -> string\n\nReturn the canonical string representation of the object.\nFor most object types, eval(repr(object)) == object.'
    pass
class reversed(object):
    'reversed(sequence) -> reverse iterator over values of the sequence\n\nReturn a reverse iterator'
    __class__ = reversed
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __length_hint__(self):
        'Private method returning an estimate of len(list(it)).'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def next(self):
        'x.next() -> the next value, or raise StopIteration'
        pass
def round(number, ndigits):
    'round(number[, ndigits]) -> floating point number\n\nRound a number to a given precision in decimal digits (default 0 digits).\nThis always returns a floating point number.  Precision may be negative.'
    pass
class set(object):
    'set() -> new empty set object\nset(iterable) -> new set object\n\nBuild an unordered collection of unique elements.'
    def __and__(self):
        'x.__and__(y) <==> x&y'
        pass
    __class__ = set
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x.'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    __hash__
    def __iand__(self):
        'x.__iand__(y) <==> x&y'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __ior__(self):
        'x.__ior__(y) <==> x|y'
        pass
    def __isub__(self):
        'x.__isub__(y) <==> x-y'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __ixor__(self):
        'x.__ixor__(y) <==> x^y'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __or__(self):
        'x.__or__(y) <==> x|y'
        pass
    def __rand__(self):
        'x.__rand__(y) <==> y&x'
        pass
    def __reduce__(self):
        'Return state information for pickling.'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __ror__(self):
        'x.__ror__(y) <==> y|x'
        pass
    def __rsub__(self):
        'x.__rsub__(y) <==> y-x'
        pass
    def __rxor__(self):
        'x.__rxor__(y) <==> y^x'
        pass
    def __sizeof__(self):
        'S.__sizeof__() -> size of S in memory, in bytes'
        pass
    def __sub__(self):
        'x.__sub__(y) <==> x-y'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def __xor__(self):
        'x.__xor__(y) <==> x^y'
        pass
    def add(self):
        'Add an element to a set.\n\nThis has no effect if the element is already present.'
        pass
    def clear(self):
        'Remove all elements from this set.'
        pass
    def copy(self):
        'Return a shallow copy of a set.'
        pass
    def difference(self):
        'Return the difference of two or more sets as a new set.\n\n(i.e. all elements that are in this set but not the others.)'
        pass
    def difference_update(self):
        'Remove all elements of another set from this set.'
        pass
    def discard(self):
        'Remove an element from a set if it is a member.\n\nIf the element is not a member, do nothing.'
        pass
    def intersection(self):
        'Return the intersection of two or more sets as a new set.\n\n(i.e. elements that are common to all of the sets.)'
        pass
    def intersection_update(self):
        'Update a set with the intersection of itself and another.'
        pass
    def isdisjoint(self):
        'Return True if two sets have a null intersection.'
        pass
    def issubset(self):
        'Report whether another set contains this set.'
        pass
    def issuperset(self):
        'Report whether this set contains another set.'
        pass
    def pop(self):
        'Remove and return an arbitrary set element.\nRaises KeyError if the set is empty.'
        pass
    def remove(self):
        'Remove an element from a set; it must be a member.\n\nIf the element is not a member, raise a KeyError.'
        pass
    def symmetric_difference(self):
        'Return the symmetric difference of two sets as a new set.\n\n(i.e. all elements that are in exactly one of the sets.)'
        pass
    def symmetric_difference_update(self):
        'Update a set with the symmetric difference of itself and another.'
        pass
    def union(self):
        'Return the union of sets as a new set.\n\n(i.e. all elements that are in either set.)'
        pass
    def update(self):
        'Update a set with the union of itself and others.'
        pass
def setattr(object, name, value):
    "setattr(object, name, value)\n\nSet a named attribute on an object; setattr(x, 'y', v) is equivalent to\n``x.y = v''."
    pass
class slice(object):
    'slice([start,] stop[, step])\n\nCreate a slice object.  This is used for extended slicing (e.g. a[0:10:2]).'
    __class__ = slice
    def __cmp__(self):
        'x.__cmp__(y) <==> cmp(x,y)'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __reduce__(self):
        'Return state information for pickling.'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def indices(self):
        'S.indices(len) -> (start, stop, stride)\n\nAssuming a sequence of length len, calculate the start and stop\nindices, and the stride length of the extended slice described by\nS. Out of bounds indices are clipped in a manner consistent with the\nhandling of normal slices.'
        pass
    start = member_descriptor()
    step = member_descriptor()
    stop = member_descriptor()
def sorted(iterable, cmp, key, reverse):
    'sorted(iterable, cmp=None, key=None, reverse=False) --> new sorted list'
    pass
class staticmethod(object):
    'staticmethod(function) -> method\n\nConvert a function to be a static method.\n\nA static method does not receive an implicit first argument.\nTo declare a static method, use this idiom:\n\n     class C:\n     def f(arg1, arg2, ...): ...\n     f = staticmethod(f)\n\nIt can be called either on the class (e.g. C.f()) or on an instance\n(e.g. C().f()).  The instance is ignored except for its class.\n\nStatic methods in Python are similar to those found in Java or C++.\nFor a more advanced concept, see the classmethod builtin.'
    __class__ = staticmethod
    __func__ = member_descriptor()
    def __get__(self):
        'descr.__get__(obj[, type]) -> value'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
class str(basestring):
    'str(object) -> string\n\nReturn a nice string representation of the object.\nIf the argument is a string, the return value is the same object.'
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = str
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __format__(self, format_spec):
        'S.__format__(format_spec) -> unicode\n\n'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getnewargs__(self):
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __sizeof__(self):
        'S.__sizeof__() -> size of S in memory, in bytes'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def _formatter_field_name_split(self):
        pass
    def _formatter_parser(self):
        pass
    def capitalize(self):
        'S.capitalize() -> string\n\nReturn a copy of the string S with only its first character\ncapitalized.'
        pass
    def center(self):
        'S.center(width[, fillchar]) -> string\n\nReturn S centered in a string of length width. Padding is\ndone using the specified fill character (default is a space)'
        pass
    def count(self, x):
        'S.count(sub[, start[, end]]) -> int\n\nReturn the number of non-overlapping occurrences of substring sub in\nstring S[start:end].  Optional arguments start and end are interpreted\nas in slice notation.'
        pass
    def decode(self):
        "S.decode([encoding[,errors]]) -> object\n\nDecodes S using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme. Default is 'strict' meaning that encoding errors raise\na UnicodeDecodeError. Other possible values are 'ignore' and 'replace'\nas well as any other name registered with codecs.register_error that is\nable to handle UnicodeDecodeErrors."
        pass
    def encode(self):
        "S.encode([encoding[,errors]]) -> object\n\nEncodes S using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme. Default is 'strict' meaning that encoding errors raise\na UnicodeEncodeError. Other possible values are 'ignore', 'replace' and\n'xmlcharrefreplace' as well as any other name registered with\ncodecs.register_error that is able to handle UnicodeEncodeErrors."
        pass
    def endswith(self, suffix, start=0, end=-1):
        'S.endswith(suffix[, start[, end]]) -> bool\n\nReturn True if S ends with the specified suffix, False otherwise.\nWith optional start, test S beginning at that position.\nWith optional end, stop comparing S at that position.\nsuffix can also be a tuple of strings to try.'
        pass
    def expandtabs(self, tabsize=8):
        'S.expandtabs([tabsize]) -> string\n\nReturn a copy of S where all tab characters are expanded using spaces.\nIf tabsize is not given, a tab size of 8 characters is assumed.'
        pass
    def find(self, sub, start=0, end=-1):
        'S.find(sub [,start [,end]]) -> int\n\nReturn the lowest index in S where substring sub is found,\nsuch that sub is contained within s[start:end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def format(self):
        'S.format(*args, **kwargs) -> unicode\n\n'
        pass
    def index(self, v):
        'S.index(sub [,start [,end]]) -> int\n\nLike S.find() but raise ValueError when the substring is not found.'
        pass
    def isalnum(self):
        'S.isalnum() -> bool\n\nReturn True if all characters in S are alphanumeric\nand there is at least one character in S, False otherwise.'
        pass
    def isalpha(self):
        'S.isalpha() -> bool\n\nReturn True if all characters in S are alphabetic\nand there is at least one character in S, False otherwise.'
        pass
    def isdigit(self):
        'S.isdigit() -> bool\n\nReturn True if all characters in S are digits\nand there is at least one character in S, False otherwise.'
        pass
    def islower(self):
        'S.islower() -> bool\n\nReturn True if all cased characters in S are lowercase and there is\nat least one cased character in S, False otherwise.'
        pass
    def isspace(self):
        'S.isspace() -> bool\n\nReturn True if all characters in S are whitespace\nand there is at least one character in S, False otherwise.'
        pass
    def istitle(self):
        'S.istitle() -> bool\n\nReturn True if S is a titlecased string and there is at least one\ncharacter in S, i.e. uppercase characters may only follow uncased\ncharacters and lowercase characters only cased ones. Return False\notherwise.'
        pass
    def isupper(self):
        'S.isupper() -> bool\n\nReturn True if all cased characters in S are uppercase and there is\nat least one cased character in S, False otherwise.'
        pass
    def join(self):
        'S.join(iterable) -> string\n\nReturn a string which is the concatenation of the strings in the\niterable.  The separator between elements is S.'
        pass
    def ljust(self):
        'S.ljust(width[, fillchar]) -> string\n\nReturn S left-justified in a string of length width. Padding is\ndone using the specified fill character (default is a space).'
        pass
    def lower(self):
        'S.lower() -> string\n\nReturn a copy of the string S converted to lowercase.'
        pass
    def lstrip(self, chars):
        'S.lstrip([chars]) -> string or unicode\n\nReturn a copy of the string S with leading whitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is unicode, S will be converted to unicode before stripping'
        pass
    def partition(self):
        'S.partition(sep) -> (head, sep, tail)\n\nSearch for the separator sep in S, and return the part before it,\nthe separator itself, and the part after it.  If the separator is not\nfound, return S and two empty strings.'
        pass
    def replace(self, old, new, count=-1):
        'S.replace(old, new[, count]) -> string\n\nReturn a copy of string S with all occurrences of substring\nold replaced by new.  If the optional argument count is\ngiven, only the first count occurrences are replaced.'
        pass
    def rfind(self, sub, start=0, end=-1):
        'S.rfind(sub [,start [,end]]) -> int\n\nReturn the highest index in S where substring sub is found,\nsuch that sub is contained within s[start:end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def rindex(self, sub, start=0, end=-1):
        'S.rindex(sub [,start [,end]]) -> int\n\nLike S.rfind() but raise ValueError when the substring is not found.'
        pass
    def rjust(self):
        'S.rjust(width[, fillchar]) -> string\n\nReturn S right-justified in a string of length width. Padding is\ndone using the specified fill character (default is a space)'
        pass
    def rpartition(self):
        'S.rpartition(sep) -> (head, sep, tail)\n\nSearch for the separator sep in S, starting at the end of S, and return\nthe part before it, the separator itself, and the part after it.  If the\nseparator is not found, return two empty strings and S.'
        pass
    def rsplit(self, sep=None, maxsplit=-1):
        'S.rsplit([sep [,maxsplit]]) -> list of strings\n\nReturn a list of the words in the string S, using sep as the\ndelimiter string, starting at the end of the string and working\nto the front.  If maxsplit is given, at most maxsplit splits are\ndone. If sep is not specified or is None, any whitespace string\nis a separator.'
        pass
    def rstrip(self, chars=None):
        'S.rstrip([chars]) -> string or unicode\n\nReturn a copy of the string S with trailing whitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is unicode, S will be converted to unicode before stripping'
        pass
    def split(self, sep=None, maxsplit=-1):
        'S.split([sep [,maxsplit]]) -> list of strings\n\nReturn a list of the words in the string S, using sep as the\ndelimiter string.  If maxsplit is given, at most maxsplit\nsplits are done. If sep is not specified or is None, any\nwhitespace string is a separator and empty strings are removed\nfrom the result.'
        pass
    def splitlines(self, keepends=False):
        'S.splitlines([keepends]) -> list of strings\n\nReturn a list of the lines in S, breaking at line boundaries.\nLine breaks are not included in the resulting list unless keepends\nis given and true.'
        pass
    def startswith(self, prefix, start=0, end=-1):
        'S.startswith(prefix[, start[, end]]) -> bool\n\nReturn True if S starts with the specified prefix, False otherwise.\nWith optional start, test S beginning at that position.\nWith optional end, stop comparing S at that position.\nprefix can also be a tuple of strings to try.'
        pass
    def strip(self, chars=None):
        'S.strip([chars]) -> string or unicode\n\nReturn a copy of the string S with leading and trailing\nwhitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is unicode, S will be converted to unicode before stripping'
        pass
    def swapcase(self):
        'S.swapcase() -> string\n\nReturn a copy of the string S with uppercase characters\nconverted to lowercase and vice versa.'
        pass
    def title(self):
        'S.title() -> string\n\nReturn a titlecased version of S, i.e. words start with uppercase\ncharacters, all remaining cased characters have lowercase.'
        pass
    def translate(self):
        'S.translate(table [,deletechars]) -> string\n\nReturn a copy of the string S, where all characters occurring\nin the optional argument deletechars are removed, and the\nremaining characters have been mapped through the given\ntranslation table, which must be a string of length 256.'
        pass
    def upper(self):
        'S.upper() -> string\n\nReturn a copy of the string S converted to uppercase.'
        pass
    def zfill(self, width):
        'S.zfill(width) -> string\n\nPad a numeric string S with zeros on the left, to fill a field\nof the specified width.  The string S is never truncated.'
        pass
def sum(sequence, start):
    "sum(sequence[, start]) -> value\n\nReturns the sum of a sequence of numbers (NOT strings) plus the value\nof parameter 'start' (which defaults to 0).  When the sequence is\nempty, returns start."
    pass
class super(object):
    'super(type) -> unbound super object\nsuper(type, obj) -> bound super object; requires isinstance(obj, type)\nsuper(type, type2) -> bound super object; requires issubclass(type2, type)\nTypical use to call a cooperative superclass method:\nclass C(B):\n    def meth(self, arg):\n        super(C, self).meth(arg)'
    __class__ = super
    def __get__(self):
        'descr.__get__(obj[, type]) -> value'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    __self__ = member_descriptor()
    __self_class__ = member_descriptor()
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    __thisclass__ = member_descriptor()
class tuple(object):
    "tuple() -> empty tuple\ntuple(iterable) -> tuple initialized from iterable's items\n\nIf the argument is a tuple, the return value is the same object."
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = tuple
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getnewargs__(self):
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __sizeof__(self):
        'T.__sizeof__() -- size of T in memory, in bytes'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def count(self, x):
        'T.count(value) -> integer -- return number of occurrences of value'
        pass
    def index(self, v):
        'T.index(value, [start, [stop]]) -> integer -- return first index of value.\nRaises ValueError if the value is not present.'
        pass
class type(object):
    "type(object) -> the object's type\ntype(name, bases, dict) -> a new type"
    __abstractmethods__ = getset_descriptor()
    __base__ = object()
    __bases__ = ()
    __basicsize__ = 872
    def __call__(self):
        'x.__call__(...) <==> x(...)'
        pass
    __class__ = type
    def __delattr__(self):
        "x.__delattr__('name') <==> del x.name"
        pass
    __dict__ = {}
    __dictoffset__ = 264
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    __flags__ = -2146544149
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __init__(self):
        'x.__init__(...) initializes x; see x.__class__.__doc__ for signature'
        pass
    def __instancecheck__():
        '__instancecheck__() -> check if an object is an instance'
        pass
    __itemsize__ = 40
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    __module__ = '__builtin__'
    __mro__ = ()
    __name__ = 'type'
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __setattr__(self):
        "x.__setattr__('name', value) <==> x.name = value"
        pass
    def __subclasscheck__(cls, subclass):
        '__subclasschck__ -> check if an class is a subclass'
        pass
    def __subclasses__():
        '__subclasses__() -> list of immediate subclasses'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    __weakrefoffset__ = 368
    def mro():
        "mro() -> list\nreturn a type's method resolution order"
        pass
def unichr(i):
    'unichr(i) -> Unicode character\n\nReturn a Unicode string of one character with ordinal i; 0 <= i <= 0x10ffff.'
    pass
class unicode(basestring):
    "unicode(string [, encoding[, errors]]) -> object\n\nCreate a new Unicode object from the given encoded string.\nencoding defaults to the current default string encoding.\nerrors can be 'strict', 'replace' or 'ignore' and defaults to 'strict'."
    def __add__(self):
        'x.__add__(y) <==> x+y'
        pass
    __class__ = unicode
    def __contains__(self, value):
        'x.__contains__(y) <==> y in x'
        pass
    def __eq__(self):
        'x.__eq__(y) <==> x==y'
        pass
    def __format__(self, format_spec):
        'S.__format__(format_spec) -> unicode\n\n'
        pass
    def __ge__(self):
        'x.__ge__(y) <==> x>=y'
        pass
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __getnewargs__(self):
        pass
    def __getslice__(self):
        'x.__getslice__(i, j) <==> x[i:j]\n           \n           Use of negative indices is not supported.'
        pass
    def __gt__(self):
        'x.__gt__(y) <==> x>y'
        pass
    def __hash__(self):
        'x.__hash__() <==> hash(x)'
        pass
    def __le__(self):
        'x.__le__(y) <==> x<=y'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __lt__(self):
        'x.__lt__(y) <==> x<y'
        pass
    def __mod__(self):
        'x.__mod__(y) <==> x%y'
        pass
    def __mul__(self):
        'x.__mul__(n) <==> x*n'
        pass
    def __ne__(self):
        'x.__ne__(y) <==> x!=y'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __rmod__(self):
        'x.__rmod__(y) <==> y%x'
        pass
    def __rmul__(self):
        'x.__rmul__(n) <==> n*x'
        pass
    def __sizeof__(self):
        'S.__sizeof__() -> size of S in memory, in bytes\n\n'
        pass
    def __str__(self):
        'x.__str__() <==> str(x)'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
    def _formatter_field_name_split(self):
        pass
    def _formatter_parser(self):
        pass
    def capitalize(self):
        'S.capitalize() -> unicode\n\nReturn a capitalized version of S, i.e. make the first character\nhave upper case.'
        pass
    def center(self):
        'S.center(width[, fillchar]) -> unicode\n\nReturn S centered in a Unicode string of length width. Padding is\ndone using the specified fill character (default is a space)'
        pass
    def count(self, x):
        'S.count(sub[, start[, end]]) -> int\n\nReturn the number of non-overlapping occurrences of substring sub in\nUnicode string S[start:end].  Optional arguments start and end are\ninterpreted as in slice notation.'
        pass
    def decode(self):
        "S.decode([encoding[,errors]]) -> string or unicode\n\nDecodes S using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme. Default is 'strict' meaning that encoding errors raise\na UnicodeDecodeError. Other possible values are 'ignore' and 'replace'\nas well as any other name registerd with codecs.register_error that is\nable to handle UnicodeDecodeErrors."
        pass
    def encode(self):
        "S.encode([encoding[,errors]]) -> string or unicode\n\nEncodes S using the codec registered for encoding. encoding defaults\nto the default encoding. errors may be given to set a different error\nhandling scheme. Default is 'strict' meaning that encoding errors raise\na UnicodeEncodeError. Other possible values are 'ignore', 'replace' and\n'xmlcharrefreplace' as well as any other name registered with\ncodecs.register_error that can handle UnicodeEncodeErrors."
        pass
    def endswith(self, suffix, start=0, end=-1):
        'S.endswith(suffix[, start[, end]]) -> bool\n\nReturn True if S ends with the specified suffix, False otherwise.\nWith optional start, test S beginning at that position.\nWith optional end, stop comparing S at that position.\nsuffix can also be a tuple of strings to try.'
        pass
    def expandtabs(self, tabsize=8):
        'S.expandtabs([tabsize]) -> unicode\n\nReturn a copy of S where all tab characters are expanded using spaces.\nIf tabsize is not given, a tab size of 8 characters is assumed.'
        pass
    def find(self, sub, start=0, end=-1):
        'S.find(sub [,start [,end]]) -> int\n\nReturn the lowest index in S where substring sub is found,\nsuch that sub is contained within s[start:end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def format(self):
        'S.format(*args, **kwargs) -> unicode\n\n'
        pass
    def index(self, v):
        'S.index(sub [,start [,end]]) -> int\n\nLike S.find() but raise ValueError when the substring is not found.'
        pass
    def isalnum(self):
        'S.isalnum() -> bool\n\nReturn True if all characters in S are alphanumeric\nand there is at least one character in S, False otherwise.'
        pass
    def isalpha(self):
        'S.isalpha() -> bool\n\nReturn True if all characters in S are alphabetic\nand there is at least one character in S, False otherwise.'
        pass
    def isdecimal(self):
        'S.isdecimal() -> bool\n\nReturn True if there are only decimal characters in S,\nFalse otherwise.'
        pass
    def isdigit(self):
        'S.isdigit() -> bool\n\nReturn True if all characters in S are digits\nand there is at least one character in S, False otherwise.'
        pass
    def islower(self):
        'S.islower() -> bool\n\nReturn True if all cased characters in S are lowercase and there is\nat least one cased character in S, False otherwise.'
        pass
    def isnumeric(self):
        'S.isnumeric() -> bool\n\nReturn True if there are only numeric characters in S,\nFalse otherwise.'
        pass
    def isspace(self):
        'S.isspace() -> bool\n\nReturn True if all characters in S are whitespace\nand there is at least one character in S, False otherwise.'
        pass
    def istitle(self):
        'S.istitle() -> bool\n\nReturn True if S is a titlecased string and there is at least one\ncharacter in S, i.e. upper- and titlecase characters may only\nfollow uncased characters and lowercase characters only cased ones.\nReturn False otherwise.'
        pass
    def isupper(self):
        'S.isupper() -> bool\n\nReturn True if all cased characters in S are uppercase and there is\nat least one cased character in S, False otherwise.'
        pass
    def join(self):
        'S.join(iterable) -> unicode\n\nReturn a string which is the concatenation of the strings in the\niterable.  The separator between elements is S.'
        pass
    def ljust(self):
        'S.ljust(width[, fillchar]) -> int\n\nReturn S left-justified in a Unicode string of length width. Padding is\ndone using the specified fill character (default is a space).'
        pass
    def lower(self):
        'S.lower() -> unicode\n\nReturn a copy of the string S converted to lowercase.'
        pass
    def lstrip(self, chars):
        'S.lstrip([chars]) -> unicode\n\nReturn a copy of the string S with leading whitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is a str, it will be converted to unicode before stripping'
        pass
    def partition(self):
        'S.partition(sep) -> (head, sep, tail)\n\nSearch for the separator sep in S, and return the part before it,\nthe separator itself, and the part after it.  If the separator is not\nfound, return S and two empty strings.'
        pass
    def replace(self, old, new, count=-1):
        'S.replace(old, new[, count]) -> unicode\n\nReturn a copy of S with all occurrences of substring\nold replaced by new.  If the optional argument count is\ngiven, only the first count occurrences are replaced.'
        pass
    def rfind(self, sub, start=0, end=-1):
        'S.rfind(sub [,start [,end]]) -> int\n\nReturn the highest index in S where substring sub is found,\nsuch that sub is contained within s[start:end].  Optional\narguments start and end are interpreted as in slice notation.\n\nReturn -1 on failure.'
        pass
    def rindex(self, sub, start=0, end=-1):
        'S.rindex(sub [,start [,end]]) -> int\n\nLike S.rfind() but raise ValueError when the substring is not found.'
        pass
    def rjust(self):
        'S.rjust(width[, fillchar]) -> unicode\n\nReturn S right-justified in a Unicode string of length width. Padding is\ndone using the specified fill character (default is a space).'
        pass
    def rpartition(self):
        'S.rpartition(sep) -> (head, sep, tail)\n\nSearch for the separator sep in S, starting at the end of S, and return\nthe part before it, the separator itself, and the part after it.  If the\nseparator is not found, return two empty strings and S.'
        pass
    def rsplit(self, sep=None, maxsplit=-1):
        'S.rsplit([sep [,maxsplit]]) -> list of strings\n\nReturn a list of the words in S, using sep as the\ndelimiter string, starting at the end of the string and\nworking to the front.  If maxsplit is given, at most maxsplit\nsplits are done. If sep is not specified, any whitespace string\nis a separator.'
        pass
    def rstrip(self, chars=None):
        'S.rstrip([chars]) -> unicode\n\nReturn a copy of the string S with trailing whitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is a str, it will be converted to unicode before stripping'
        pass
    def split(self, sep=None, maxsplit=-1):
        'S.split([sep [,maxsplit]]) -> list of strings\n\nReturn a list of the words in S, using sep as the\ndelimiter string.  If maxsplit is given, at most maxsplit\nsplits are done. If sep is not specified or is None, any\nwhitespace string is a separator and empty strings are\nremoved from the result.'
        pass
    def splitlines(self, keepends=False):
        'S.splitlines([keepends]) -> list of strings\n\nReturn a list of the lines in S, breaking at line boundaries.\nLine breaks are not included in the resulting list unless keepends\nis given and true.'
        pass
    def startswith(self, prefix, start=0, end=-1):
        'S.startswith(prefix[, start[, end]]) -> bool\n\nReturn True if S starts with the specified prefix, False otherwise.\nWith optional start, test S beginning at that position.\nWith optional end, stop comparing S at that position.\nprefix can also be a tuple of strings to try.'
        pass
    def strip(self, chars=None):
        'S.strip([chars]) -> unicode\n\nReturn a copy of the string S with leading and trailing\nwhitespace removed.\nIf chars is given and not None, remove characters in chars instead.\nIf chars is a str, it will be converted to unicode before stripping'
        pass
    def swapcase(self):
        'S.swapcase() -> unicode\n\nReturn a copy of S with uppercase characters converted to lowercase\nand vice versa.'
        pass
    def title(self):
        'S.title() -> unicode\n\nReturn a titlecased version of S, i.e. words start with title case\ncharacters, all remaining cased characters have lower case.'
        pass
    def translate(self):
        'S.translate(table) -> unicode\n\nReturn a copy of the string S, where all characters have been mapped\nthrough the given translation table, which must be a mapping of\nUnicode ordinals to Unicode ordinals, Unicode strings or None.\nUnmapped characters are left untouched. Characters mapped to None\nare deleted.'
        pass
    def upper(self):
        'S.upper() -> unicode\n\nReturn a copy of S converted to uppercase.'
        pass
    def zfill(self, width):
        'S.zfill(width) -> unicode\n\nPad a numeric string S with zeros on the left, to fill a field\nof the specified width. The string S is never truncated.'
        pass
def vars(object):
    'vars([object]) -> dictionary\n\nWithout arguments, equivalent to locals().\nWith an argument, equivalent to object.__dict__.'
    pass
class xrange(object):
    'xrange([start,] stop[, step]) -> xrange object\n\nLike range(), but instead of returning a list, returns an object that\ngenerates the numbers in the range on demand.  For looping, this is \nslightly faster than range() and more memory efficient.'
    __class__ = xrange
    def __getattribute__(self):
        "x.__getattribute__('name') <==> x.name"
        pass
    def __getitem__(self, index):
        'x.__getitem__(y) <==> x[y]'
        pass
    def __iter__(self):
        'x.__iter__() <==> iter(x)'
        pass
    def __len__(self):
        'x.__len__() <==> len(x)'
        pass
    def __new__(cls, *args, **kwargs):
        'T.__new__(S, ...) -> a new object with type S, a subtype of T'
        pass
    def __reduce__(self):
        pass
    def __repr__(self):
        'x.__repr__() <==> repr(x)'
        pass
    def __reversed__(self):
        'Returns a reverse iterator.'
        pass
    def __subclasshook__(cls, subclass):
        'Abstract classes can override this to customize issubclass().\n\nThis is invoked early on by abc.ABCMeta.__subclasscheck__().\nIt should return True, False or NotImplemented.  If it returns\nNotImplemented, the normal algorithm is used.  Otherwise, it\noverrides the normal algorithm (and the outcome is cached).\n'
        pass
def zip():
    'zip(seq1 [, seq2 [...]]) -> [(seq1[0], seq2[0] ...), (...)]\n\nReturn a list of tuples, where each tuple contains the i-th element\nfrom each of the argument sequences.  The returned list is truncated\nin length to the length of the shortest argument sequence.'
    pass
