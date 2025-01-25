#include<stdlib.h>
#include<stdio.h>
#include <string.h>
#include"autocomplete.h"
int compare(const void* str1, const void* str2){
    char* s1 = (*(const term*)str1).term;
    char* s2 = (*(const term*)str2).term;
    return strcmp(s1, s2);
}

int compare_weights(const void* str1, const void* str2){
    double w1 = (*(const term*)str1).weight;
    double w2 = (*(const term*)str2).weight;
    if(w1 < w2){
        return 1;
    }else if(w1 > w2){
        return -1;
    } else {
        return 0;
    }
}

void read_in_terms(struct term **terms, int *pnterms, char *filename) {
    FILE *fp = fopen(filename, "r");
    if (fp == NULL) {
        exit(1);
    }
    fscanf(fp, "%d\n", pnterms); //read in terms from 1st line
    *terms = (term*)malloc((*pnterms) * sizeof(term)); //allocate memory
    if (*terms == NULL){
        fclose(fp);
        exit(1);
    }
    char line[200];
    for (int i = 0; i < *pnterms; i++) {
        if (fgets(line, sizeof(line), fp) != NULL) {
            // parse weight
            char *ptr = strchr(line, '\t');
            if (ptr != NULL) {
                *ptr = '\0'; // null-terminate the weight part
                (*terms)[i].weight = atof(line); // convert weight to double
                // parse term and remove null char
                strncpy((*terms)[i].term, ptr + 1, sizeof((*terms)[i].term) - 1);
                (*terms)[i].term[sizeof((*terms)[i].term) - 1] = '\0'; // make sure null-termination occurs
                char *newline = strchr((*terms)[i].term, '\n');
                if (newline != NULL) {
                    *newline = '\0'; // remove newline character
                }
            }
        }
    }
    // sort
    qsort(*terms, *pnterms, sizeof(term), compare);
    fclose(fp);
}

int lowest_match(term *terms, int nterms, char *substr){
    int min = 0;
    int max = nterms - 1;
    int index = -69420; // track position

    while (min <= max) {
        int mid = (min + max) / 2;
        int cmp = strcmp(terms[mid].term, substr);
    // check if current term is match
        if (strncmp(terms[mid].term, substr, strlen(substr)) == 0) {
            // found match, continue searching to the left to find the lowest match
            index = mid; // update index with current match
            max = mid - 1; // move left to find the lowest possible match
        } else if (cmp < 0) {
            // current term is lexicographically less than the substring
            min = mid + 1;
        } else {
            // current term is lexicographically greater than or equal to the substring
            max = mid - 1;
        }
    }

    return index; // return the index of the lowest match, or -69420 if no match found
}

int highest_match(term *terms, int nterms, char *substr){
    int min = 0;
    int max = nterms - 1;
    int index = -69420;
    while (min <= max){
        int mid = (min + max)/2;
        int cmp = strcmp(terms[mid].term, substr);
        if (strncmp(terms[mid].term, substr, strlen(substr)) == 0){
            index = mid;
            min = mid + 1;
        }else if (cmp < 0){
            min = mid + 1;
        }else{
            max = mid - 1;
        }
    }
    return index;
}

void autocomplete(term **answer, int *n_answer, term *terms, int nterms, char *substr){
    int lm_index = lowest_match(terms, nterms, substr);//store the index of the lowest match
    int hm_index = highest_match(terms, nterms, substr);//store index of the highest match
    if (lm_index == -1 || hm_index == -1){
        *n_answer = 0;
    }
    *answer = (term*)malloc(sizeof(term)*nterms);//allocate memory
    *n_answer = hm_index - lm_index + 1;
    for(int i = 0; i < hm_index -lm_index + 1; i++){
        strcpy((*answer)[i].term, terms[i + lm_index].term);
        (*answer)[i].weight = terms[i + lm_index].weight;
    }
    qsort(*answer, *n_answer, sizeof(term), compare_weights);
}