#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <time.h>

void insertion_sort(int *arr, int left, int right) { //klasyczny insertion sort
    for (int i = left + 1; i <= right; i++) {
        int key = arr[i];
        int j = i - 1;
        while (j >= left && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

void parallel_insertion_sort(int *arr, int n) {//przyjmujemy tablice i jej rozmiar
    int num_threads = omp_get_max_threads();
    
    int chunk = n / num_threads; //dzielimy tablice na liczbę wątków jakie mamy udostępnione

    #pragma omp parallel
    {
        int tid = omp_get_thread_num();
        int left = tid * chunk; //wydzielamy dla każdego wątku po jego kawałku
        
        int right = (tid == num_threads - 1) ? (n - 1) : (left + chunk - 1); //jeśli to ostatni wątek to przydzielamy mu końcówkę, jeśli nie to dalszy chunk
        
       
        if (left <= right) { //takie tam sprawdzenie
            insertion_sort(arr, left, right);
        }
    }

    
    insertion_sort(arr, 0, n - 1); //na koniec i tak musimy zrobić po całości ułożenie elementów -> Insertion Sort jest anty openMP :(
}

void generate_random_array(int *arr, int size) { //generacja losowych liczb
    
    for(int i=0; i<size; ++i){
        arr[i] = rand() % 10000;
    }
}

int main() {
    srand(time(NULL)); 

    int sizes[] = {2000, 500000};

    for (int s = 0; s < sizeof(sizes) / sizeof(sizes[0]); s++) { //operacje dla dwóch rodzajów danych dla podanej ilości wątków po kolei
        int size = sizes[s];
        int *array = (int*) malloc(size * sizeof(int));
        if (!array) {
            printf("Blad alokacji pamieci.\n");
            return 1;
        }
        
        generate_random_array(array, size);
        
        int threads = omp_get_max_threads();
        double start = omp_get_wtime();
        parallel_insertion_sort(array, size);
        double end = omp_get_wtime();

        printf("Sortowanie %d elementow dla %d watkow trwalo: %f sekund\n", size, threads, end - start);
        

        free(array);
    }
    
    printf("\n\n");

    return 0;
}
