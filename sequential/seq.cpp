#include <iostream>
#include <vector>
#include <random>
#include <ctime>
#include <omp.h>

// Wartości do testów
const int N = 2000;       // Rozmiar pierwszego zbioru
const int M = 500000;     // Rozmiar drugiego zbioru
const int MIN = 0;        // Minimalna wartość losowanej liczby
const int MAX = RAND_MAX; // Maksymalna wartość losowanej liczby

void insertion_sort(std::vector<int> &arr)
{
    for (int i = 1; i < arr.size(); ++i)
    {
        int key = arr[i];
        int j = i - 1;
        while (j >= 0 && arr[j] > key)
        {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

void fill_rand(std::vector<int> &arr, int min, int max)
{
    std::random_device rd;
    std::mt19937 gen(rd());
    std::uniform_int_distribution<> dist(min, max);
    for (int &i : arr)
    {
        i = dist(gen);
    }
}

int main()
{
    // Test 1 dla zbioru o rozmiarze N
    std::vector<int> arr1(N);
    fill_rand(arr1, MIN, MAX);
    double t1 = omp_get_wtime();
    insertion_sort(arr1);
    double t2 = omp_get_wtime();
    std::cout << "Czas sortowania (n = " << N << "): " << t2 - t1 << " s" << std::endl;

    // Test 2 dla zbioru o rozmiarze M
    std::vector<int> arr2(M);
    fill_rand(arr2, MIN, MAX);
    double t3 = omp_get_wtime();
    insertion_sort(arr2);
    double t4 = omp_get_wtime();
    std::cout << "Czas sortowania (n = " << M << "): " << t4 - t3 << " s" << std::endl;
}