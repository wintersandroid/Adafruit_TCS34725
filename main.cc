#include <iostream>
#include <wiringPi.h>

#include "./Adafruit_TCS34725.h"


int main(int, char**){
    std::cout << "start" << std::endl;
    wiringPiSetup();
    Adafruit_TCS34725 sensor;
    sensor.begin();

    sensor.enable();
    for(int i = 0; i < 10; i++){
        uint16_t r,  g,  b,  c;
        sensor.setInterrupt(false);
        delay(100);
        sensor.getRawData(&r,&b,&g,&c);
        delay(100);
        sensor.setInterrupt(true);
        std::cout << "raw: " << r << " " << g << " " << b << " " << c << std::endl;
        delay(1000);
    }
}