//anything that starts with # is  a pre-processor instruction
#include <stdio.h>
#include<math.h>
#include "lec09.h"
#include <string.h>
#include <stdlib.h>
//header files: can give the compiler instrutcions for tasks that are peformed before compilation
//#include "lec09.h" copy-pastes the file into the program

//strings in structs:
typedef struct student2_wptr{
    char* name; //we storee the address where the name is stored
    //need to allocate name for each student
} student2;
typedef struct student3_noptr{
    char name[200]; //we store 200 characters
    //don't need to allocate name for each student
}student3;
int main(){
    printf("Hello, World!💩\n");
    say_hi();
    student1 s;
    s.age = 20;
    double x = sqrt(2.0);
    strcpy(s.name, "Default");
    printf("%s\n", s.name);
    return 0;
    //Reminder: strings
    char* name;
    //strcpy(name, "Alice") not allowed because name is not a valid address for that
    name = (char*)malloc(sizeof(char)*100);
    strcpy(name, "Alice");//Ok now
    //name = "Alice"; //Ok, but cannot modify name[0]; if didn't free name, thats a memory leak
    char name1[200] = "Bob";
   // name1 = "Alice"; //bad cannot reassign to arrays
   //strcpy(name1, "Alice"); Ok
   name1[0] = 'a'; //Ok
    student2 s2;
    //strcpy(s2.name, "John"); //can't do this because s2.name not a valid address
    s2.name = "John"; //Ok
    s2.name = (char*)malloc(sizeof(char)*20);
    s2.name = strcpy(s2.name, "John"); //Ok after mallocing
    //when freeing, need to say
    free(s2.name);

    student3 s3; strcpy(s3.name, "John"); //Ok
}