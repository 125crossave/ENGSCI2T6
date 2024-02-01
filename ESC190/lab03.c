#include <stdio.h>
#include <stdlib.h>
//Q1
void set_int1(int x)
{
x = 42;
}
void set_int2(int* p_x)
{
*p_x = 42;
}
//Q2
typedef struct student1{
char name[200];
char student_number[11];
int year;
} student1;
void print_student1(student1 s){
    printf("%s\n", s.name);
    printf("%s\n", s.student_number);
    printf("%d\n", s.year);
}
//Q3a)
void set_default_name(student1* p_s){
    strcpy((*p_s).name, "Default Student");
}
//Q3b)
void set_default_name_wrong(student1 s){
     strcpy(s.name, "Default Student");
     s.year = 0;
}//The modification to s.name and s.year only happens locally
//Q4
void create_block1(student1** p_p_s, int n_students){
    *p_p_s = (student1*)malloc(sizeof(student1)*n_students);
}
//Q5
void set_name(student1* p_s, const char* input){
    strncpy(p_s[0].name, input, 199);
    printf("%s\n", p_s[0].name);
}
//Q6
void destroy_block1(student1* p_s){
    free(p_s);
}
typedef struct student2{
char *name;
char *student_number;
int year;
} student2;
//Q7
void create_block2(student2** p_p_s, int num_students){
    *p_p_s = (student2*)malloc(sizeof(student2)*num_students);
    for (int i = 0; i < strlen(); i++){

    }
}

//Q8
void set_name2(student2* p_s){

    strcpy(p_s[0].name, "Hullo");
    printf("%s", p_s[0].name);
}

int main(){
 int a = 5; int b = 5;
 set_int1(a);//no effect because it only changes x locally in the fcn
 set_int2(&b);//works because the value of b is modified globally
 student1 s = {.name = "Molly", .student_number = "1008103142", .year = 2024};
 print_student1(s);
 set_default_name(&s); print_student1(s);
set_default_name_wrong(s);
print_student1(s);
student1* students;
int num = 10;
create_block1(&students, num);
const char* c = "Hello";
set_name(students, c);
destroy_block1(students);
}