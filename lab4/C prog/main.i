# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "sdvig.h" 1


void readArray(int size, int* arr);
void printArray(int size, int* arr);
void shiftArray(int size, int n, int* arr);
# 2 "main.c" 2
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
