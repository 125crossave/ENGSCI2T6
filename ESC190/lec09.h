#include <string.h>
#if !defined(STUDENT_H)//convention is to use uppercase identifiers for preprocessor macros
#define student
void say_hi(){
    printf("HI!\n");
}
//preprocessor: can only define structs once, can use "include guard" in an h file to avoid defining things twice if the header file is included multiple times
typedef struct student1{
    char name[20];
    int age;
}student1;
#endif