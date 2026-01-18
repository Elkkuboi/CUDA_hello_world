#include <iostream>
#include <stdio.h>


// global tarkoittaa, että funktio kutsutaan cpu:lta
// mutta se suoritetaan gpu:lla

__global__ void cudaHello() {
    // jokaisella säikeellä on uniikki id
    // tulostetaan se, jotta näemme rinnakkaisuuden
    printf("Hello World from GPU thread %d!\n", threadIdx.x);
}

int main() {
    // CPU
    std::cout << "Hello World from CPU!" << std::endl;

    // käynnistetään kernel GPU:lla
    // <<< lohkojen määrä, säikeiden määrä per lohko >>>

    cudaHello<<<1,5>>>();

    // synkronoidaan, että cpu odottaa gpu:ta
    cudaDeviceSynchronize();
    return 0;
}