#Q3
def changearr(array):
    array[0] = 'c'

arr = ['a', 'b', 'c']
changearr(arr)
print(arr)
#differences: python does not require pointer to change the value of the array

def times(a,b):
    if b == 0:
        return 0
    if b == 1:
        return a
    return times(a, b - 1) + a