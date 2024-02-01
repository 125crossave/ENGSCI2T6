#include <stdio.h>
//Functions
//add takes in two integers and returns an integer
int add(int a, int b){
    return a + b;
}
double sum(double x, double y){
    return x + y;
}
//Functions and pointers
int f(int* p_a){
    *p_a = 43; //takes in an address and uses dereference operater * to change the value stored at that address
    //analagous to passing a list in python
}
//arrays and pointers: when used, arrays are generally converted to the pointer to the first element
//ex: a[0] is the same thing as *(a+0), the first element of a

//if a fcn doesn't return anything, we call it void
void change_a(int* p_a){
    *p_a = 44;
}
void g(int* aa){
    *aa = 8;
}
void h(int* a){
    a[0] = 7;
}
int main(){
    int arr[] = {5, 10, 2};//can use braxes in initialization but not elsewhere
    arr[0] = 3;
    //cannot say arr = {1, 2, 3}; //can only use {} notation for initialization
    int a = 42;
    printf("%d\n", a);
    double s = sum(1.2, 3.4);
    printf("%f\n", s);
    printf("%ld\n", s);//when try to make s print as a datatype (lf = long int) that it isn't, C interprets it as a long int which produces a nonsensical result//in VSCode the compiler warns that you are doing something that doesn't make sense when you do this
    char* str = "hello";
    printf("%s is stored at address %ld\n", str, str);
    //casting: "converting between types"
    //in quotes because it doesn't really convert between types, but instead does the same thing as printf with the wrong type: it interprets the data as if it were in the type I say
    //(int) 1.2 -> 1 (truncates)
    // (long int)str : just the address of the first element of str
    //examples:
    int arra[] = {5, 6, 7};
    printf("%d\n", arra[0]);// 5
    printf("%ld\n", arra); // the address where the array starts
    //the location of the 5
    printf("%d\n", *arra);// 5, because *arra is the same as arra[0] //is the same as *(arr + 0)
    char* str2 = "hello";
    printf("%c\n", str2[0]); //h
    printf("%c\n", *str2); //h
    printf("%c\n", *(str2 + 0)); //h

    int aa = 43;
    int* p_aa = &aa;//p_aa is the address of aa
    change_a(p_aa); //change the address of aa//aa is now 44
    //int* stores the address of an int
    //*p_a means the value at address p_a
    //&a means the address of a
    //you copy the value to the local variable from the fcn call
    //arr[0] is the same as *arr
    int t[] = {5, 6, 7};
    t[0] = 6;
    int* p = t;
    g(t);
    printf("%d\n", t[0]);

    int n = 45; h(&n); printf("%d\n", n);//7
}