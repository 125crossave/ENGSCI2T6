import ctypes

def deref(addr, typ):
    return ctypes.cast(addr, ctypes.POINTER(typ))

def change_a(a):
    deref(id(a), ctypes.c_int)[6] = 43

a = 59000
change_a(a)
print(a)
print(59000)
s = "abc"