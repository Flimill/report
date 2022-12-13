#include "sdvig.h"
int main() {
    int n; 
	int size;

    printf("n: ");
    scanf("%d", &n);
    
    printf("size: ");
    scanf("%d", &size);
    
    const int getSize(int n){
return size * sizeof(int);
}

    int arr[size];
    
    readArray(size, &arr);
    
    shiftArray(size, n, &arr);
    
    
    printf("\n");
    printArray(size, &arr);
    return 0;
}

