#include <stdio.h>

int main() {

    int num[] = {1,2,3,5,1,7,8,3};

    int max = num[0];

    for (int i = 0; i < 9; i++) {
        if (num[i] > max) {
            max = num[i];
        }
    };

    printf(max);

    return 0;
}