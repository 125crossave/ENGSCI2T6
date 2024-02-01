#Q4
def binary_search_deluxe(L, target):
    indices = [0,0]
    min = 0
    max = len(L) - 1
    while min <= max:
        mid = (max + min)//2
        if L[mid] > target:
            max = mid - 1
        elif L[mid] < target:
            min = mid + 1
        else:
            if mid == 0 or L[mid - 1] != target:
                min = mid
            max = mid - 1
    indices[0] = min
    min = 0
    max = len(L) - 1
    while min <= max:
        mid = (max + min)//2
        if L[mid] > target:
            max = mid - 1
        elif L[mid] < target:
            min = mid + 1
        else:
            if mid == len(L) - 1 or L[mid + 1] != target:
                max = mid
            min = mid + 1
    indices[1] = max
    return indices

print(binary_search_deluxe([1,2,3,4,4,5,5,6,7,10],5))
print(binary_search_deluxe([1, 2, 3, 4], 1))
print(binary_search_deluxe([1, 2, 3, 4], 4))
print(binary_search_deluxe([1, 2, 3,3,3,3, 4], 3))
print(binary_search_deluxe([1,1, 2, 3,3,3,3, 4], 1))
print(binary_search_deluxe([1,1, 2, 3,3,3,3, 4,4], 4))