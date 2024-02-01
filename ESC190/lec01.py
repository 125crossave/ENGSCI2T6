L = [[[[1,2]], 5], 2]
def deepcopy(L):
    #Return a deep copy of L. which is either a list (of list of lists.. of ints) or an int
    if type(i) != list:
            return(L)
    L2 = []
    for i in L:
        if type(i) == list:
            L2.append(deepcopy(i))
        else:
            L2.append(i)
    return L2

#shallow copy of L:
L2 = L[:] #L2 = L.copy() is the same

#print all strings of length 4 within the given string
alphabet = "abcdefgh"
for letter1 in alphabet:
     for letter2 in alphabet:
          for letter3 in alphabet:
               for letter4 in alphabet:
                    print(letter1 + letter2 + letter3 + letter4)
                    #repeats n^4 times
                    #repeats as many times as there are 4-letter strings in the alphabet

#Want to list all strings of length k over the alphabet
alph = "abcd"
count = 0
for letter1 in alph:
     #use a helper fcn to get all completions
     #letter1 + (string of length k-1 over the alphabet)

def all_strings(k, alph):
    '''Return a list of all strings of len k over the aphabet'''
    if k == 0:
         return [""]
    L = []
    all_k1_strings = all_strings(k-1, alphabet)
    for letter in alphabet:
        for string in all_k1_strings:
            L.append(letter + string)
    return L
    #repeats n^k times
    #line 42 repeats n^k + n^(k - 1) + n^(k-2) ... + n^2 + n + 1 = (n^(k+1) - 1)/(n-1) so time complexity is O(n^k)