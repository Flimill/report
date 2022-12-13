#include "sdvig.h"
void readArray(int size, int* arr) {
	int i = 0;
    for (i; i < size; i++) {
        printf("array[%d] = ", i);
        scanf("%d", &arr[i]);
    }
}
void printArray(int size, int* arr) {
	int i = 0;
    for (i; i < size; ++i) {
        printf("array[%d] = %d\n", i, arr[i]);
    }
}
void shiftArray(int size, int n, int* arr) {
	int j = 0;
	int t0 = 0;
	int t1 = 0;
	for (j; j < n ; j++){
		int i = size - 1;
		t1 = arr[i];
		i--;
	    for (i; i >= 0; i--) {
	    	t0 = arr[i];
	        arr[i] = t1;
	        t1 = t0;
	    }
	    arr[size - 1] = t1;
	}
}
