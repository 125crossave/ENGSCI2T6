#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int changevalue(int* a){
    *a = 10;
}
char changestring(char* ptrar){
    ptrar[0] = ptrar[0]+8; //"hi"->"pi" as the first char moves up 8 letters in alphabet
}
int insertionSort(int* ptra, int length){
     int i = 1; int j;
     while (i < (length)){
        j = i;
        while (j > 0 && ptra[j-1] > ptra[j]){
            int n = ptra[j-1];
            ptra[j-1] = ptra[j];
            ptra[j] = n;
            j = j-1;
        }
        i++;
     }
}

int stlen(char* ptr){
    int i = 0;
    while (*ptr != '\0'){
        ptr++;
        i++;
    }
    return i;//time complexity O(n) where n = length of ptr
}
//

void seq_replace(int *arr1, unsigned long arr1_sz, int *arr2, unsigned long arr2_sz){
    bool potential_match;
    for (int i = 0; i < arr1_sz; i++){
        int j = 0;
        potential_match = true;
        while ((potential_match == true) && (j < arr2_sz) && i+j < arr1_sz){
            if ((arr2[j] == arr1[i + j])){
                j++;
            }
            else{
                potential_match = false;
            }
        }
        if (potential_match == true){
            for (int k = 0; k < arr2_sz; k++){
                arr1[k + i] = 0;
            }
        }
    }
}//time complextiy is O(arr1_sz*arr2_sz)

int main(){
    int a = 5;
    int* b = &a; //&a is address of a, b is a pointer to the value stored in the address of a
    changevalue(b);
    printf("%d\n", a);
    char ar[100] = "hi";
    char* pptrar = ar;
    changestring(pptrar);
    printf("%s\n", ar);
    int i = 0;
    int c[5] = {6, 3, 2, 5, 4};
    int len = sizeof(c)/sizeof(c[0]);
    int* ptrc = c;
    insertionSort(ptrc, len);
    // initialize i to 0, run the loop while i < 5, and increase i by 1 every time;
    // Here, i++ is the same as i = i + 1
    for(i = 0; i < 5; i++){
        printf("%d\n", c[i]);
    }
    char* p = "hi";;
    int l = stlen(p);
    printf("%d\n", l);
    int f[] = {1, 2, 3, 4, 5, 1, 2, 3};
    int g[] = {1, 2};
    unsigned long flen = 8;
    unsigned long glen = 2;
    seq_replace(f, flen, g, glen);
    for(int m = 0; m < flen; m++){
        printf("%d\n", f[m]);
    }
}