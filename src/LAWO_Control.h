/*
 * LAWO_Control.h
 *
 *  Created on: 21 Apr 2020
 *      Author: pechj
 */

// Copyright (C) 2016 Julian Metzler
// modified in 2020 by Jérôme Pech

/*
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


#ifndef LAWO_CONTROL_H_
#define LAWO_CONTROL_H_

#include "LAWO_MCP23017.h"

#include "Icons.h"
#include "Font.h"

#define FLIP_DURATION       2 // in microseconds
#define FLIP_PAUSE_DURATION 1 // in microseconds

enum pxStates {
  BLACK  = 0,
  YELLOW = 1
};

enum flipspeed {
  FS_NORMAL = 250,
  FS_SLOW   = 500
};

#ifndef _swap_int16_t
#define _swap_int16_t(a, b)                                                    \
  {                                                                            \
    int16_t t = a;                                                             \
    a = b;                                                                     \
    b = t;                                                                     \
  }
#endif

template<uint8_t ADDR_Y, uint8_t ADDR_B, const uint8_t * COLUMN_LINES,const uint8_t * E_LINES,const uint8_t D, const uint8_t MCP_RESET, const uint8_t LED>
class LAWODisplay {
private:
  LawoFont lawoFont;
  MCP23017Type<ADDR_Y> ROW_MCP_Y;
  MCP23017Type<ADDR_B> ROW_MCP_B;
  uint16_t flipSpeedFactor;
  uint8_t lastColIndex;
  uint8_t lastRowIndex;
  uint8_t lastState;
  uint8_t charSpacing;
  bool initOK;
  bool mcp_ok;
  uint16_t PixelState[MATRIX_WIDTH]; //uint16_t 16bit represent the 16 rows
  uint16_t NextPixelState[MATRIX_WIDTH]; //uint16_t 16bit represent the 16 rows
private:
  void initPins() {
    pinMode(MCP_RESET, OUTPUT);
    for (uint8_t i = 0; i< 5; i++) {
      pinMode(COLUMN_LINES[i], OUTPUT);
      pinMode(E_LINES[i], OUTPUT);
    }
    pinMode(D, OUTPUT);
    pinMode(LED, OUTPUT);
  }

  bool initMCP() {
    //strobe RESET to reset the chip
    digitalWrite(MCP_RESET, LOW);
    delay(2);
    digitalWrite(MCP_RESET, HIGH);
    delay(25);
    //this initializes the MCP, sets all pins to OUTPUT and puts state LOW
    bool mcp_y_ok = ROW_MCP_Y.init();
    bool mcp_b_ok = ROW_MCP_B.init();
    mcp_ok = (mcp_y_ok && mcp_b_ok) ;

    if (!mcp_ok) {
      Serial.println("Error while initializing MCP23017");
      return false;
    }
    return true;
  }

  void selectColumn(byte colIndex) {
    /*
     * Select the appropriate panel for the specified column index and set the column address pins accordingly.
     */
    if (initOK) {

#ifdef COL_SWAP
      colIndex = PANEL_WIDTH - colIndex - 1;
#endif

      // In the case of a matrix with a 14-col panel at the end instead of a 28-col one, we need to remember that our panel index is off by half a panel, so flip the MSB
      bool halfPanelOffset = hasHalfPanelOffset(colIndex);

      // Additionally, the address needs to be reversed because of how the panels are connected
      colIndex = MATRIX_WIDTH - colIndex - 1;

      // Since addresses start from the beginning in every panel, we need to wrap around after reaching the end of a panel
      byte address = colIndex % PANEL_WIDTH;

      // A quirk of the FP2800 chip used to drive the columns is that addresses divisible by 8 are not used, so we need to skip those
      address += (address / 7) + 1;

      digitalWrite(COLUMN_LINES[0], address & 1);
      digitalWrite(COLUMN_LINES[1], address & 2);
      digitalWrite(COLUMN_LINES[2], address & 4);
      digitalWrite(COLUMN_LINES[3], address & 8);
      digitalWrite(COLUMN_LINES[4], halfPanelOffset ? !(address & 16) : address & 16);
    }
  }

  void selectRow(byte rowIndex, bool yellow) {
    if (initOK) {
#ifdef ROW_SWAP
      rowIndex = MATRIX_HEIGHT - rowIndex - 1;
#endif
      ROW_MCP_Y.writeAll(0);
      ROW_MCP_B.writeAll(0);
      if (yellow)
        ROW_MCP_Y.writePin(rowIndex, HIGH);
      else
        ROW_MCP_B.writePin(rowIndex, HIGH);

      digitalWrite(D, !yellow);
    }
  }

  void flip(byte col) {

    /*
     * Send an impulse to the specified panel to flip the currently selected dot.
     */

    // Get the enable line for the specified panel
    if (initOK) {

      byte e = E_LINES[PANEL_LINES[col / PANEL_WIDTH]];

      digitalWrite(e, HIGH);
      delayMicroseconds(FLIP_DURATION * flipSpeedFactor);

      digitalWrite(e, LOW);
      delayMicroseconds(FLIP_PAUSE_DURATION * flipSpeedFactor);
    }

    yield();
  }

  void deselect() {
    if (initOK) {
      ROW_MCP_Y.writeAll(LOW);
      ROW_MCP_B.writeAll(LOW);

      digitalWrite(COLUMN_LINES[0], LOW);
      digitalWrite(COLUMN_LINES[1], LOW);
      digitalWrite(COLUMN_LINES[2], LOW);
      digitalWrite(COLUMN_LINES[3], LOW);
      digitalWrite(COLUMN_LINES[4], LOW);
    }
  }

  void setPixelPhysical() {
    unsigned long start = millis();
    for (uint8_t c = 0; c < MATRIX_WIDTH; c++) {
      for (uint8_t r = 0; r < MATRIX_HEIGHT; r++) {
        bool currentPixelState = bitRead(PixelState[c], r);
        bool nextPixelState = bitRead(NextPixelState[c], r);

        if (currentPixelState != nextPixelState) {
        bitWrite(PixelState[c], r, nextPixelState);

        selectColumn(c);
        selectRow(r, nextPixelState);
        flip(c);
       }
      }
    }
    deselect();
    Serial.print("setPixelPhysical():");Serial.print(millis() - start,DEC);Serial.println("ms");
  }

  void setPixel(byte colIndex, byte rowIndex, bool state) {
      bitWrite(NextPixelState[colIndex], rowIndex, state);
  }

  void setFlipSpeed(uint16_t s) {
    flipSpeedFactor = s;
  }

  void drawLineV(uint8_t col, uint8_t row, uint8_t width, bool state) {
    //Serial.print("drawLineV col: "); Serial.print(col, DEC);Serial.print(", row: ");Serial.print(row, DEC);Serial.print(", width: ");Serial.println(width);
    for (uint8_t i = 0; i < width; i++) {
      setPixel(col+i, row, state);
    }
  }

  void drawLineH(uint8_t col, uint8_t row, uint8_t height, bool state) {
    //Serial.print("drawLineH col: "); Serial.print(col, DEC);Serial.print(", row: ");Serial.print(row, DEC);Serial.print(", height: ");Serial.println(height);
    for (uint8_t i = 0; i < height; i++) {
      setPixel(col, row + i, state);
    }
  }

  void writeLine(uint8_t x0, uint8_t y0,  uint8_t x1, uint8_t y1, bool state) {
    int16_t steep = abs(y1 - y0) > abs(x1 - x0);
    if (steep) {
     _swap_int16_t(x0, y0);
     _swap_int16_t(x1, y1);
    }

    if (x0 > x1) {
      _swap_int16_t(x0, x1);
      _swap_int16_t(y0, y1);
    }

    int16_t dx, dy;
    dx = x1 - x0;
    dy = abs(y1 - y0);

    int16_t err = dx / 2;
    int16_t ystep;

    if (y0 < y1) {
      ystep = 1;
    } else {
      ystep = -1;
    }

    for (; x0 <= x1; x0++) {
      if (steep) {
        drawPixel(y0, x0, state);
      } else {
        drawPixel(x0, y0, state);
      }
      err -= dy;
      if (err < 0) {
        y0 += ystep;
        err += dx;
      }
    }
  }

  void drawBitmap(uint8_t IconIndex, uint8_t col_offset, uint8_t row_offset, bool state, bool invert, bool disable) {
    //The first half of the icon bytes (i.e. byte 0...23 for an icon width of 24px (which has total 48 Bytes) represent the upper 8 rows
    //The second half of the icon bytes (24...47) represent the lower 8 rows
    uint8_t iconWidth = Icons[IconIndex].width;
    uint8_t iconHeight = Icons[IconIndex].height;
    const uint8_t *icondata =  Icons[IconIndex].Icon;

    for (uint8_t i = 0 ; i < iconWidth; i++) {

      uint8_t rowscan = 8;
      if (iconHeight > 8) rowscan = iconHeight / 2;

      for (uint8_t j = 0; j < rowscan; j++) {
        //Rows 0 - 7
        byte data = pgm_read_byte(&icondata[i]);
        bool bit = bitRead(data, j) == invert ? 1 : 0;
        if (bit)
         drawPixel(i+col_offset, j + row_offset, state, false);
       if (iconHeight > 8) {
          //Rows 8 - 15
          data = pgm_read_byte(&icondata[i+iconWidth]);
          bit = bitRead(data, j) == invert ? 1 : 0;
          if (bit)
            drawPixel(i+col_offset, j + row_offset + rowscan, state, false);
        }
     }

    }

   if (disable) deselect();
  }

public:
  LAWODisplay () : flipSpeedFactor(FS_NORMAL), lastColIndex(0xff), lastRowIndex(0xff), lastState(0), charSpacing(1), initOK(false), mcp_ok(false) {}
  virtual ~LAWODisplay() {}

  void setLED(bool state) {
    digitalWrite(LED, (state == 1) ? LOW : HIGH);
  }
  
  bool init() {
    lawoFont.setFont(LawoFont::DefaultFont);
    initIcons();
    initPins();
    setLED(0);

    initOK = initMCP();

    Serial.print("LAWODisplay Init ");Serial.println(initOK ? "OK":"ERROR");

    return initOK;
  }

  void clear(bool withYellow = true) {
    if (withYellow) {
      for (byte col = 0; col < MATRIX_WIDTH; col++) {
        selectColumn(col);
        for (int row = 0; row < MATRIX_HEIGHT; row++) {
          selectRow(MATRIX_HEIGHT - row - 1, 1);
          flip(col);
        }
      }

      memset(PixelState, 0xffff, MATRIX_WIDTH * sizeof(uint16_t));
      delay(200);
    }

    for (byte col = 0; col < MATRIX_WIDTH; col++) {
      selectColumn(col);
      for (int row = 0; row < MATRIX_HEIGHT; row++) {
        selectRow(MATRIX_HEIGHT - row - 1, 0);
        flip(col);
      }
    }

    deselect();

    memset(PixelState, 0, MATRIX_WIDTH * sizeof(uint16_t));
  }

  void black() {
    memset(NextPixelState, 0, MATRIX_WIDTH * sizeof(uint16_t));
  }

  void yellow() {
    memset(NextPixelState, 0xffff, MATRIX_WIDTH * sizeof(uint16_t));
  }

  void drawPixel(uint8_t col, uint8_t row, bool state, bool disable = true) {
    setPixel(col, row, state);
    if (disable) deselect();
  }
  
  void repairPixel(uint8_t col, uint8_t row) {
    uint16_t s = flipSpeedFactor;
    setFlipSpeed(FS_SLOW);
    for (uint8_t i = 0; i < 20; i++) {
      drawPixel(col, row, YELLOW);
      delay(200);
      drawPixel(col, row, BLACK);
      delay(200);
    }
    setFlipSpeed(s);
  }

  uint8_t printChar(uint8_t col_offset, uint8_t row_offset, uint8_t chr, bool state) {
    uint8_t   cBuf[24];
    uint8_t   dBuf[24];

    const uint8_t dbl_offset = 128;
    bool doubleHeight = (lawoFont._fontInfo.height == 16);

    uint8_t charWidth = lawoFont.getChar(chr, sizeof(cBuf)/sizeof(cBuf[0]), cBuf);

    if (doubleHeight) lawoFont.getChar(chr + dbl_offset, sizeof(dBuf)/sizeof(dBuf[0]), dBuf);

    //Serial.print("charWidth = ");Serial.println(charWidth, DEC);

    for (uint8_t col = 0 ; col < charWidth; col++) {
      for (uint8_t row = 0; row < 8; row++) {

        bool bit = bitRead(doubleHeight ? dBuf[col] : cBuf[col], row);
        if (bit) {
          setPixel(col + col_offset, row + row_offset, (bit == state));
        }

        if (doubleHeight) {
          bit = bitRead(cBuf[col], row);
          if (bit) {
            setPixel(col + col_offset, row + row_offset + 8, (bit == state));
          }
        }
      }
    }

    deselect();

    return charWidth;
  }

  void setCharSpacing(uint8_t s) {
    charSpacing = s;
  }

  void print(byte X, byte Y, const char * Text, bool state = YELLOW) {
    uint8_t charPos = X;
    for (uint8_t i = 0; i < strlen(Text); i++) {
      uint8_t lastCharWidth = printChar(charPos, Y, Text[i], state);
      charPos += lastCharWidth;
      charPos += charSpacing;
    }
  }

  void print(byte X, byte Y, String Text, bool state, uint8_t charSpacing = 1) {
    print(X, Y, Text.c_str(), state, charSpacing);
  }

  void setFont(LawoFont::fontType_t *f) {
    lawoFont.setFont(f);
  }

  uint8_t getCenterPos(const char * Text, uint8_t w) {
    return lawoFont.getCenterPos(Text, w);
  }

  void drawRect(uint8_t col, uint8_t row,  uint8_t width, uint8_t height, bool state, bool disable = true) {
    drawLineV(col, row,          width, state);
    drawLineV(col, row + height - 1, width, state);
    drawLineH(col,             row, height-1, state);
    drawLineH(col + width -1 , row, height-1, state);
    if (disable) deselect();
  }

  void fillRect(uint8_t col, uint8_t row,  uint8_t width, uint8_t height, bool state, bool disable = true) {
    for (uint8_t i = 0; i < width; i++) {
      drawLineH(col+i, row, height, state);
    }
    if (disable) deselect();
  }

  void drawLine(uint8_t x0, uint8_t y0,  uint8_t x1, uint8_t y1, bool state, bool disable = true) {
    if (x0 == x1) {
      if (y0 > y1)
        _swap_int16_t(y0, y1);
      drawLineV(x0, y0, y1 - y0, state);
    } else if (y0 == y1) {
      if (x0 > x1)
        _swap_int16_t(x0, x1);
      drawLineH(x0, y0, x1 - x0, state);
    } else {
      writeLine(x0, y0, x1, y1, state);
    }
    if (disable) deselect();
  }

  void drawIcon(uint8_t IconIndex, uint8_t col_offset, uint8_t row_offset, bool state) {
    drawBitmap(IconIndex, col_offset, row_offset, state, false, true);
  }

  void drawIconInvert(uint8_t IconIndex, uint8_t col_offset, uint8_t row_offset, bool state) {
    drawBitmap(IconIndex, col_offset, row_offset, state, true, true);
  }

  void drawCircle(int16_t x0, int16_t y0, int16_t r, bool state) {
    int16_t f = 1 - r;
    int16_t ddF_x = 1;
    int16_t ddF_y = -2 * r;
    int16_t x = 0;
    int16_t y = r;

    drawPixel(x0, y0 + r, state);
    drawPixel(x0, y0 - r, state);
    drawPixel(x0 + r, y0, state);
    drawPixel(x0 - r, y0, state);

    while (x < y) {
      if (f >= 0) {
        y--;
        ddF_y += 2;
        f += ddF_y;
      }
      x++;
      ddF_x += 2;
      f += ddF_x;

      drawPixel(x0 + x, y0 + y, state);
      drawPixel(x0 - x, y0 + y, state);
      drawPixel(x0 + x, y0 - y, state);
      drawPixel(x0 - x, y0 - y, state);
      drawPixel(x0 + y, y0 + x, state);
      drawPixel(x0 - y, y0 + x, state);
      drawPixel(x0 + y, y0 - x, state);
      drawPixel(x0 - y, y0 - x, state);
    }
  }

  void moveRight(bool invert = false) {
    uint16_t temp[MATRIX_WIDTH];
    temp[0] = invert ? 0xffff : 0;
    for (uint8_t c = 0; c < MATRIX_WIDTH - 1; c++) {
      temp[c+1] = PixelState[c];
    }
    drawPixMap(temp);
  }

  void moveLeft(bool invert = false) {
    uint16_t temp[MATRIX_WIDTH];
    temp[MATRIX_WIDTH-1] = invert ? 0xffff : 0;
    for (uint8_t c = 0; c < MATRIX_WIDTH - 1; c++) {
      temp[c] = PixelState[c+1];
    }
    drawPixMap(temp);
  }

  void moveUp(bool invert = false) {
    uint16_t temp[MATRIX_WIDTH];
    for (uint8_t c = 0; c < MATRIX_WIDTH; c++) {
      temp[c] = PixelState[c] >> 1;
      if (invert) bitSet(temp[c],15);
    }
    drawPixMap(temp);
  }

  void moveDown(bool invert = false) {
    uint16_t temp[MATRIX_WIDTH];
    for (uint8_t c = 0; c < MATRIX_WIDTH; c++) {
      temp[c] = PixelState[c] << 1;
      if (invert) bitSet(temp[c],0);
    }
    drawPixMap(temp);
  }

  bool getPixelState(uint8_t col, uint8_t row) {
    return bitRead(PixelState[col], row);
  }

  uint16_t getColumn(uint8_t col) {
    return PixelState[col];
  }

  uint32_t getRow(uint8_t row) {
    uint32_t i = 0;
    for (uint8_t c = 0; c < MATRIX_WIDTH; c++) {
      i |= bitRead(PixelState[c],row)<<c;
    }

    return i;
  }

  void getPixMap(uint16_t dstMap[MATRIX_WIDTH]) {
    memcpy(dstMap, PixelState, MATRIX_WIDTH);
  }

  String dumpPixMap() {
    unsigned int c_len = 0;
    unsigned char i, j, k;
    uint8_t num_modules = sizeof(PANEL_LINES);
    uint8_t num_columns = MATRIX_WIDTH;
    uint8_t num_rows = MATRIX_HEIGHT;
    for (j = 0; j < num_modules; ++j) {
      c_len += num_columns;
    }
    c_len = ((c_len + 10) * (num_rows + 3)) + 1;

    char *c = (char *)malloc(c_len);
    c_len = 0;

    for (i = 0; i < num_rows; ++i) {
      c_len += sprintf(c + c_len, "\n%2u ", i);
      for (j = 0; j < num_modules; ++j) {
        for (k = 0; k < num_columns; ++k) {
          c[c_len++] = (bitRead(PixelState[k],i) == 1) ? '@' : '.';
        }
      }
    }
    c[c_len++] = '\n';
    c[c_len] = 0;
    String s(c);
    free(c);

    return s;
  }

  uint16_t * get_dots() {
    return PixelState;
  }

  void show() {
    setPixelPhysical();
  }

  void invert() {
    for (uint8_t c = 0; c < MATRIX_WIDTH; c++) {
      for (uint8_t r = 0; r < MATRIX_HEIGHT; r++) {
        bool currentPixelState = bitRead(PixelState[c],r);
        setPixel(c, r, !currentPixelState);
      }
    }
  }

  void drawPixMap(uint16_t srcMap[MATRIX_WIDTH]) {
    for (uint8_t c = 0; c < MATRIX_WIDTH; c++) {
      for (uint8_t r = 0; r < MATRIX_HEIGHT; r++) {
        bool newPixelState = bitRead(srcMap[c],r);
        bool currentPixelState = bitRead(PixelState[c],r);

        if (newPixelState != currentPixelState) {
          setPixel(c, r, newPixelState);
        }
      }
    }
    setPixelPhysical();
  }
};

#endif /* LAWO_CONTROL_H_ */
