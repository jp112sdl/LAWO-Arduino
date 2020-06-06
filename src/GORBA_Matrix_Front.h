#ifndef __LAWO_MATRIX_PANEL_H__
#define __LAWO_MATRIX_PANEL_H__
#include <Arduino.h>

#define MATRIX_WIDTH 126
#define MATRIX_HEIGHT 16
#define PANEL_WIDTH   28

byte PANEL_LINES[5] = {0, 1, 2, 3, 4};

bool hasHalfPanelOffset(__attribute__((unused)) byte colIndex) {
  return true;
}
#endif
