void change_a(int* p_a){
    *p_a = 43;
}
void dont_change_a(int a){
    a = 43;//change the value of the local variable a to 43
}
void swap(int* p_a, int* p_b){
    int i = *p_b;
    *p_b = *p_a;
    *p_a = i;
}
void set_arr0(int* arr){
    arr[0] = 44;//same as *arr because arr[j] is the same as *(arr + j)
}
void set_arr1(int* arr){
    arr = 0; //changes the local variable arr to 0, no effect outside the fcn
}
int main(){
    int a = 42;
    //want to change a to 43
    change_a(&a);//changes a to 43
    dont_change_a(a);//doesn't change the value of a
    int b = 44; int c = 45;
    //swap(b,c)//impossible to make this work if you pass ints into the swap function
    swap(&b, &c);//possible with pointers
    printf("NUmber 1 = %d, Number 2 = %d", b, c);
    int arr[] = {5,6,7}; //*&arr is the same as arr
    set_arr0(arr); //arr[0] is now 44

    //Review: strings in C
    //C does not have strings
    //Instead, it has a bunch of characters that are stored in a sequence
    char s1[] = "abc"; //an array of type char, with the characters 'a', 'b', 'c', '\0'
    //shorthand for initializing s1 in the following way: char s1[] = {'a', 'b', 'c', '\0'};
    char* s2 = "abc";//put the block 'a', 'b', 'c', '\0' somewhere in memory
    // s2 is the address where the 'a' is stored
    //Difference: an array is generally a local variable which only exists while the function is still running, s2 on the other hand stores the address of a memory block that will persist in memory

    //const char*
    //The literal "abc" is actually of type const char*
    //The compiler will not let you modify values at addresses of type const char*
    //But, it will let you convert const char* to char* and then try to modify the values at the memory address

    char* s3  = "abc";//warning: implicit conversion to char*
    s3[0] = 'x'; //will compile, but might crash at runtime,
    const char* s4 = "abc";
    //s4[0] = 'y'; will not compile

    //const int, char, etc
    const int n = 42;//a = 43; error
    const char c = 'x';//c = 'y'; error
    //char* const
    char* const str = "hello";
    //str = "world"; //error
    str[0] = "H"; //OK
    //the point of const is to ensure that something never gets modified if you know you do not want to modify it, so that the compiler gives you an error if you end up accidentally trying to modify it
}