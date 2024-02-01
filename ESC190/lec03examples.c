#include <stdio.h>

int main(){
    int a = 42;
    int b; //non-initialized, can have any value, legal but can create problems
    char *s1 = "abcdef";//
    char c = '@';
    double d = 3.14;
    // printf("The integer is : %d\n", a);
    // printf("The character is : %c\n", c);
    // printf("The double is %f\n", d);
    // printf("The char is : %c\n", c);
    // printf("The double is : %f\n", a); //giving it something that makes no sense to it
    int* p_a = &a;//p_a stores the address of a
    printf("The address of a is %ld\n", p_a);
    //*p_a: the value stored at the address of a
    printf("The value stored at the address of a is %d\n", *p_a);
    //addresses of values are referred to as "pointers"
    double x = 12.34;
    double* address_of_var_x = &x;
    double y = 25 + *address_of_var_x; //y = 25 + 12.34
    char* s1 = "hello!"; //s1 is address of where h is stored; here, * is used as part of char*
    char c = *s1; // c = 'h';//here. * is used as a deferencing operator to obtain the value stored at the address s1 (which is h)
}