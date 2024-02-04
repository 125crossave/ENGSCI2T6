#include <stdio.h>
#include <stdlib.h>
int* f(){
    int arr[20];
    arr[0] = 42;
    return arr;
}
int* make_block_ints(int sz){
    int* p = (int *)malloc(sz*sizeof(int));
    if (p == NULL){
        printf("out of memory\n");
        exit(1);
    }
    return p;
}
//blocks of structs
typedef struct student{
    char name[200];
    int age;
}student;
//array:
student students[500];
student* students_block = (student*)malloc(sizeof(student)*500);//tell malloc to give space to store the block of 500 student


 //pointers to pointers
    //Sometimes, want to chanfe teh value of a pointer inside a fcn

void set_to_0(int** p_p_a){
    *p_p_a = 0;//set the value at address p_p_a to 0
    //p_p_a happens to be of type int**
    //so, *p_p_a is of type int*
}
void set0(int* p){
    *p = 0;
}
void set0_pointer(int** pp){
    *pp = 0; //sets the address to 0
}
int main(){
    int* p = f();
    //p[0] //undefined behaviour because arr in *f() is a local variable, not global
    //might crash, or might someitmes print 42
    int* q = make_block_int(20);
    q[7] = 50; //works

    //arrays vs memoery blocks:
    //(local) arrays only exist until the fcn returns:
        //can try returning the address of the elements of an array (or the address of another local vairable, but behaviour is undefined)
    //free
    //good pratcice to free() memory blocks that you allocated
    //C cannot use a malloced block for something new until its freed
    //Memory leak: situation where memory is leaked but neve freed
    //how would one use malloc? as follows:
    //int* block = (int*)malloc(size*sizeof(int));
    //use block
    //free(block);
    //block[0] //undefined behaviour, might crash

    //Deling with strings:
    char s1[] = "hi";//same as char s1[] = {'h', 'i', '\0'}
    char* s2;
    //s2 = s1; legal, but strings are now aliases
    //strcpy(s2, s1); not legal yet, since cannot copy to address s2
    //same as s2[0] = s1[0], s2[1] = s1[1], etc.
    //need to use malloc:
    s2 = (char*)malloc(sizeof(char)*strlen(s1) + 1);//need to put +1 to account for null character at end of string


    int a = 42; int* p_a = &a; set_to_0(&p_a); //p_a is now 0, a is not affected
}