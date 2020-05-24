/*
 * LAWO_MCP23017.h
 *
 *  Created on: 26 Apr 2020
 *      Author: jp112sdl
 */

#ifndef LAWO_MCP23017_H_
#define LAWO_MCP23017_H_
#include <Arduino.h>

#define MCP23017_IODIRA 0x00
#define MCP23017_IODIRB 0x01
#define MCP23017_GPIOA  0x12
#define MCP23017_GPIOB  0x13
#define MCP23017_OLATA  0x14
#define MCP23017_OLATB  0x15

#include <Wire.h>

template <uint8_t MCP23017_ADDRESS=0x20>
class MCP23017Type {
private:
  bool    available        = false;
  uint8_t currentRegA      = 0x00;
  uint8_t currentRegB      = 0x00;

  bool initWire(uint8_t addr) {
    Wire.beginTransmission(addr);
    return (Wire.endTransmission() == 0);
  }

  uint8_t regForPin(uint8_t pin, uint8_t portAaddr, uint8_t portBaddr){
    return (pin<8) ? portAaddr : portBaddr;
  }

  uint8_t readRegister(uint8_t addr){
    Wire.beginTransmission(MCP23017_ADDRESS);
    Wire.write(addr);
    Wire.endTransmission();
    Wire.requestFrom((uint8_t)MCP23017_ADDRESS, (uint8_t)1);
    return Wire.read();
  }

  void updateRegisterBit(uint8_t pin, uint8_t pValue, uint8_t portAaddr, uint8_t portBaddr) {
    uint8_t regAddr=regForPin(pin,portAaddr,portBaddr);
    uint8_t bit=pin%8;
    uint8_t regValue = readRegister(regAddr);
    bitWrite(regValue,bit,pValue);
    writeRegister(regAddr,regValue);
  }

  void writeRegister(uint8_t regAddr, uint8_t regValue){
    Wire.beginTransmission(MCP23017_ADDRESS);
    Wire.write(regAddr);
    Wire.write(regValue);

    if (regAddr == MCP23017_OLATA)
      currentRegA = regValue;
    else if (regAddr == MCP23017_OLATB)
      currentRegB = regValue;

    Wire.endTransmission();
  }

  void pinMode(uint8_t p, uint8_t d) {
    updateRegisterBit(p,(d==INPUT),MCP23017_IODIRA,MCP23017_IODIRB);
  }

public:

  void writePin(uint8_t pin, uint8_t d) {
    uint8_t bit=pin%8;
    uint8_t regAddr=regForPin(pin,MCP23017_OLATA,MCP23017_OLATB);
    //uint8_t gpio = readRegister(regAddr);
    uint8_t gpio = regAddr == MCP23017_OLATA ? currentRegA : currentRegB;
    bitWrite(gpio,bit,d);
    regAddr=regForPin(pin,MCP23017_GPIOA,MCP23017_GPIOB);
    writeRegister(regAddr,gpio);
  }

  void writeAll(uint16_t ba) {
    Wire.beginTransmission(MCP23017_ADDRESS);
    Wire.write(MCP23017_GPIOA);
    Wire.write(ba & 0xFF);
    Wire.write(ba >> 8);
    Wire.endTransmission();
    currentRegA = ba & 0xFF;
    currentRegB = ba >> 8;
  }

  bool init() {
    Wire.begin();
    if (initWire(MCP23017_ADDRESS) == true) {
      writeRegister(MCP23017_IODIRA,0xff);
      writeRegister(MCP23017_IODIRB,0xff);
      for (uint8_t i = 0; i < 16; i++){
        pinMode(i, OUTPUT);
      }
      writeAll(0);
      available = true;
      Wire.setClock(800000L);
      return true;
    }
    Serial.printf("MCP23017Type: no MCP23017 found at address %#01x\n",MCP23017_ADDRESS);
    available = false;
    return false;
  }
};



#endif /* LAWO_MCP23017_H_ */
