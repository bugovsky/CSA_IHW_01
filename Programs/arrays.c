#include <stdio.h>
#include <stdlib.h>

void input(int *arr, int size) {
    for (int i = 0; i < size; ++i) {
        int number;
        scanf("%d", &number);
        arr[i] = number;
    }
}

int getMax(int *arr, int size) {
    int current_max = arr[0];
    for (int i = 1; i < size; ++i) {
        if (current_max < arr[i]) {
            current_max = arr[i];
        }
    }
    return current_max;
}

void changeArray(int *arr, int *changed_arr, int max_of_arr, int size) {
    for (int i = 0; i < size; ++i) {
        if (arr[i] < 0) {
           changed_arr[i] = max_of_arr;
        } else {
            changed_arr[i] = arr[i];
        }
    }
}

void output(int *arr, int size) {
    for (int i = 0; i < size; ++i) {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main() {
    int size;
    scanf("%d", &size);
    if (size < 0 || size > 100000) {
    	printf("Incorrect length");
    } else {
        int *start_array = malloc(size * sizeof(int));	
        input(start_array, size);
        int max_of_start_array = getMax(start_array, size);
        int *final_array = malloc(size * sizeof(int));
        changeArray(start_array, final_array, max_of_start_array, size);
        output(final_array, size);
        free(start_array);
        free(final_array);
    }
    return 0;
}
