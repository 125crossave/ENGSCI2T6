#include <stdio.h>
#include <stdlib.h>
int my_strlen(const char* s){
    int len = 0;
    while(s[len]!='\0'){
        len++;
    }
    return len;
}

int my_strlen2(const char* str){
    int len = 0;
    while(*str != '\0'){
        len++;
        str++;//str = str + 1, moves to the address of the next value in the array
    }
}
// x!= '\0' is the same as x when treated as a boolean
//in C, the value of A = B is B (and it has the effect of assigning B to A)
//a = (c = 3); //first set c to 3, and then set a to 3
//the value of a++ is a (and it has the ffect of incrementing a by 1)
//int a = 5; int b = 4; b = a++;//set b to 4, and set a to 6, and set b to 5
int strlen_short(const char* str){
    int len = 0;
    while(*(str++)){
        len++;
    }
    return len;
}
int strlen_rec(const char* str){
    if(*str == '\0'){
        return 0; //length is 0
    } else{
        return 1 + strlen_rec(str + 1); //adds one to length and passes the string shortened by one character into the same function
    }
}
void sz(int* a){
    printf("Size of address: %d\n", sizeof(a));//8 since this is the address
    printf("Size of value: %d\n", sizeof(*a));//4 since that's the size of integer
}

int main(){
    const char* str = "hi";
    printf("%d\n", my_strlen(str));
    //malloc:
//local arrays disappear once a fcn has finished running
//arrays in C are not resizable
//malloc allocates space in the memory table to store a block of values
// int* block_int = (int*)malloc(sizeof(int)*150);//allocate space for 150 integers,//malloc returns the address of element 0,//cast the address to int*
// block_int[7] = 42;
// *(block + 7) = 42;

int* block_int = (int *)malloc(sizeof(int)*2);//1032
block_int + 1; //1034
block_int[1]; //same as *(block_int + 1)

//sizeof(int) //usually 4 bytes
//sizeof(char) //always 1 byte
//sizeof(char *); sizeof(int*);//usually addresses take up 8 bytes//NOT the length of a string/array
//sizeof:
int arr[] = {1,2,3};
sizeof(arr)/sizeof(arr[0]); //length of the array
//but note that if arr is passed to a fcn, it is converted to a pointer

int b = 6; sz(&b);
}