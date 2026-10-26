#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void CUDAVectorAdd(int* a, int* b, int* c)
{
    int i = threadIdx.x;
    c[i] = a[i] + b[i];
}

int main()
{
    int vecA[] = { 1, 2, 3 };
    int vecB[] = { 4, 5, 6 };
    int vecC[sizeof(vecA) / sizeof(int)] = {};

    int* cudaA;
    int* cudaB;
    int* cudaC;

    cudaMalloc(&cudaA, sizeof(vecA));
    cudaMalloc(&cudaB, sizeof(vecB));
    cudaMalloc(&cudaC, sizeof(vecC));

    cudaMemcpy(cudaA, vecA, sizeof(vecA), cudaMemcpyHostToDevice);
    cudaMemcpy(cudaB, vecB, sizeof(vecB), cudaMemcpyHostToDevice);
    cudaMemcpy(cudaC, vecC, sizeof(vecC), cudaMemcpyHostToDevice);

    CUDAVectorAdd<<<1, sizeof(vecA) / sizeof(int)>>>(cudaA, cudaB, cudaC);

    cudaDeviceSynchronize();
    cudaMemcpy(vecC, cudaC, sizeof(vecC), cudaMemcpyDeviceToHost);

    printf("Result: %d, %d, %d\n", vecC[0], vecC[1], vecC[2]);

    cudaFree(cudaA);
    cudaFree(cudaB);
    cudaFree(cudaC);


    return 0;
}