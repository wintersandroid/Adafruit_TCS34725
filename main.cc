#include <iostream>
#include "./Adafruit_TCS34725.h"


int main(int, char**){
    std::cout << "start" << std::endl;

    for(int i = 0; i < 100; i++){
        std::cout << "Count " << i << std::endl;
    }
}