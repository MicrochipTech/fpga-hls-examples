#include <stdio.h>

#define SIZE 200

void row_cumulative_sum(int grid[SIZE][SIZE]) {
#pragma HLS function top
    for(int i=0; i<SIZE; i++) {
#pragma HLS loop pipeline
        for(int j=0; j<SIZE-1; j++) {
            grid[i][j+1] += grid[i][j];
        }
    }
}

int main() {
    int grid[SIZE][SIZE];
    for(int i=0; i<SIZE; i++) {
        for(int j=0; j<SIZE; j++) {
            grid[i][j] = i + j;
        }
    }
    // we just print the top-left corner to see what it's doing
    for(int i=0; i<10; i++) {
        for(int j=0; j<10; j++) {
            printf("%d\t", grid[i][j]);
        }
        printf("\n");
    }
    printf("\n");
    row_cumulative_sum(grid);
    for(int i=0; i<10; i++) {
        for(int j=0; j<10; j++) {
            printf("%d\t", grid[i][j]);
        }
        printf("\n");
    }
}