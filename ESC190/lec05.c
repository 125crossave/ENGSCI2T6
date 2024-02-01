#include <stdio.h>
void f(int b){
    b = 42; //f(43) copies 43 to local vairable b. The variable b is local, so f has no effect.
}
void g(int* p_a){
    p_a = 0;//int a = 45; f(&a) copies &a to local variable p_a. The variable p_a is local, so f has no effect
}

void h(int* p_a){
    *p_a = 0;//int a = 45; f(&a) copies &a to local variable p_a. The variable p_a is local, but *p_a is the same as a which was declared outside the function, so f does have an effect
}

void i(int a[]){//int a[] exactly the same as int* a
    a[0] = 7;
}

//Storing blocks of values: Strings and arrays are examples of blocks of values
//Blocks of values are stored consecutively
//ex 1032: 'h', 1033:'i', 1034:'\0' \\ hi
//2064: 3 (2064 + 4): 4 \\{3, 4}

//rules: all variables need ot be declared, char* means a value of type "address of char",
//array elements and string elements are stored in consecutive cells of memory,
int main(){
    char* s = 'xyz';//s is the address where 'x' is stored,
    int arr[] = {4, 5};//arr gets converted into the address where the 4 is stored,
    int a = 42;
    int* p_a = &a; //p_a is the address where a is stored;

    //pointer arithmetic:
    // char* s = "hi"; s is address of h (let it be 1032)
    // s + 1; //1033
    // *(s+1); //'i'
    //int arr[] = {3, 4} (suppose that arr = 2064)
    //arr + 1; //2064 + 4
    //*(arr + 1); //4 //*(arr + 1) increments the address by one element size (in terms of bytes), not just by one byte (unless the element size is one byte, i.e. the element is char, unsigned char, or signed char) (for example, address arr + 1 for an int array is 4 higher than address arr, since size of a single int is 4 bytes)

    //accessing elements: arr[5] is the same as *(arr + 5)

    int arr[] = {4,5,6};
    sizeof(arr); //12
                // the total number of memory cells occupised by the array arr
                //gives you an idea of the number of elements in the array
                //sizeof(arr)/sizeof(arr[0]) gives you the number of elements in the array = 3
    int* p_a0 = arr;
    //sizeof(p_a0) //NOT the number of elements in the array * 4
                    //instead, it is the number of memory cells occupied by an address
    //p_a0[0] is exactly the same as *(p_a0 + 0)
}