#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
//Q1
void changestringaddress(char** arr){
    printf("%s\n", "How many characters do you want to print");
    int len;
    scanf(" %d", &len);
    int i = 0;
    *arr = (char *)malloc(sizeof(char) * len);
    while (i < len){
         printf("%s\n", "Enter the next characer you want");
        scanf(" %c", *arr + i); // &(*arr)[i]
        i++;
    }
}
//Q2v1
void my_strcat(char* dest, const char*src){
    int lensrc = strlen(src); int lendest = strlen(dest);
    for (int j = 0; j < lensrc; j++){
        dest[lendest + j] = src[j];
    }
     dest[lendest + lensrc] = '\0';

}
//Q2v2
void my_strcat2(char* dest, const char* src){
    int lensrc = strlen(src); int lendest = strlen(dest);
    for (int j = 0; j < lensrc; j++){
        *(dest + lendest + j) = *(src + j);
    }
    *(dest + lendest + lensrc) = '\0';
}
//Q3
int my_strcmp_rec(char* str1, char* str2){
if ((str1[0] == '\0') && (str2[0] == '\0')){//can interchange str1[0] here with *str1, since *str1 = *(str1 + 0)
    return 0;
}else if (*str1 == '\0'){
    return -1;
} else if (*str2 == '\0'){
    return 1;
} else if (*str1 > *str2){
    return 1;
} else if (*str2 > *str1){
    return -1;
}else{
         return my_strcmp_rec(str1 + 1, str2 + 1);
    }
}
//Q5
int my_atoi(char* str){
    int res = 0;int tens = 1;
    for (int i = strlen(str) - 1; i > -1; i--){
        if (isdigit(str[i])){
            res = res + (tens * (str[i]-'0'));
            tens = tens * 10;
    }
        }
    return res;
}

int main(){
    // char* string = "hello";
    // changestringaddress(&string);
    // printf("Your string is: %s", string);
    char* str1 = "bYe"; char* str2 = "bYee";printf("%d\n", my_strcmp_rec(str1, str2));
   // printf("%d", my_strcmp_rec(str1, str2));}
   char str3[] = "Rizzmaster"; char str4[] = "9000"; my_strcat(str3, str4); printf("The concatenated string is %s\n", str3);
   char str5[] = "Rizzmaster"; char str6[] = "9000"; my_strcat2(str5, str6); printf("The concatenated string is %s\n", str5);
   char* num = "69420"; printf("%d\n", my_atoi(num));
}