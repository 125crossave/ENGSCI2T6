#include <stdio.h>

int main()
{
    //before using variable, need to declare
    //optionally can also intiialize it
    //(intializing = assigning an initial value to it)
    int b; //b is an integer and is not intialized, can have any value
    //almost in 100% of cases, want to intiialize
    printf("Hello World\n");
    char* s1 = "hi!"; //put "hi!", followed by '\0' in memory
    //stores the address of h in s1
    //%s: string (i.e. the sequence of characters at the given address)
    printf("%s\n", s1);
    printf("%ld\n", s1);
    printf("The string is : %s, the ddress is %ld\n", s1, s1);
    int a = 43;
    printf("The integer is: %d\n", a);
    //printf("The integer is: %s\n", a);error because it goes to address 43 instead of the actual address--43 is too small so it segmentation fault
    char c = '@'; //char is a data type used to only store a single character
    //error char c1 = '23329723902';
    //error char c2 = "abc";

    return 0;
}