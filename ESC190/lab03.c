#include <stdio.h>
#include <stdlib.h>
//Q12
#include "lab03.h"
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
    for (int i = 0; i < num_students; i++){
        (*p_p_s)[i].name = 0;
        (*p_p_s)[i].student_number = 0;
    }
}
//Q8
void set_name2(student2* p_s){
    char* str = "Hullo";
    (*p_s).name = (char*)malloc(strlen(str) + 1);
    strcpy(p_s[0].name, "Hullo\n");
    printf("%s", p_s[0].name);
}
//Q9
void destroy_block2(student2** p_p_s, int num_students){
    for (int i = 0; i < num_students; i++){
        free((*p_p_s)[i].name);
        free((*p_p_s)[i].student_number);
    }
    free(*p_p_s);//need to free after you've freed the names and student numbers, not before (because if you do  it before then undefined behaviour occurs)
}
//Q10

//Q11 ./lab03.exe
//Q13
void printfile(char* filename, int num_lines){
char line[200];
FILE* fp = fopen(filename, "r");
for(int i = 0; i < num_lines; i++){
fgets(line, sizeof(line), fp); //read in at most sizeof(line) characters
//(including ’\0’) into line.
printf("%s", line);
}
fclose(fp);
printf("\n");
}
//Q14
void printavg(char* filename){
    char line[20]; int sum = 0;
    FILE* fp = fopen(filename, "r");
    while(fgets(line, sizeof(line), fp)) {
        sum += atoi(line);
    }
    fclose(fp);
    printf("%d\n", sum);
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
student2* studentz;
int num2 = 3; create_block2(&studentz, num2);
set_name2(studentz);

const char* filename = "lab03.txt";
int n = 3;
printfile(filename, n);
printavg(filename);
}