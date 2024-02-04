#include <stdio.h>
//OPtion: Store everything inside the struct
typedef struct student1{
    char name[50]; //analagous to char name0, charname1, ..., charname49;
    double gpa;
}student1;
//Option: Store a pointer to the name inside the struct
//Student2 takes up less space than student1, because storing char* takes up less space than storing char name[50]
typedef struct student2{
    char* name;
    double gpa;
}student2;

int main(){
    student1 s1[150];//150 cells of student1's
    //can have a malloced block of student1's:
    student1* s1_block = (student1*)malloc(150*sizeof(student1));
    //unlike s1, can return s1 block, because the address s_1 block is valid until we explicitly free it

    student2 s2[150]; //150 cells of student2's
    //however, just because we have an array of student2's does not mean we get to start accessing it
    //for example, cannot say printf("%s\n", s2[0].name); right now
    //however, we can say printf("%f\n", s2[0].gpa); since gpa has some value
    //name has a value too, but that is an address instead of an int, and so cannot be printed
    //printf("%ld", s2[0].name)//will print some arbitrary value

    s2[0].name = "John"; //fine, but not allowed to modify s2[0].name[0] to 'j'

    //or
    s2[0].name = (char *)malloc(50 * sizeof(char));
    strcpy(s2[0].name, "John"); //fine
    //above is same as
    //s2[0].name[0] = 'J';
    //s2[0].name[1] = 'o';
    //s2[0].name[2] = 'h';
    //s2[0].name[3] = 'n';
    //s2[0].name[4] = '\0';

    //way #3
    student2** p_s2_block; //the address of the first element of the block of objcets that are of typ student2*

    p_s2_block = (student2 **)malloc(150*sizeof(student2*));

    int i;
    for(i = 0; i < 150; i++){
        p_s2_block[i] = (student2*)malloc(sizeof(student2));
        p_s2_block[i]->gpa = 4.0;//alternatively: (*p_s2_block)[i].gpa = 4.0;
    }
}