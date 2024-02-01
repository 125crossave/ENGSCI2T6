int linear_search(int *a, int sz, int elem){
for (int i = 0; i < sz; i++){
    if (a[i] == elem){
        return i;
    }
}
}
void reverse_arr(int *arr, int sz){
    for (int i = 0; i < sz/2; i++){
        int temp = arr[i];
        arr[i] = arr[sz - i - 1];
        arr[sz - i - 1] = temp;
}
}