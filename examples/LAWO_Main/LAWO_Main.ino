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


/*
 * MATRIX-SPECIFIC INCLUDE
 *
 * Since different matrix configurations have different properties, we put them in different external files
 */


#include "LAWO_Matrix_Side.h"
#include "LAWO_Control.h"

/*
 * PIN DECLARATIONS
 */

// The associations between address and actually selected matrix row are not 1:1, so we need to use a lookup table
// The values in this array represent the address needed to drive the row corresponding to the array index
#define ADDRESS_ROW_MCP_Y     0x20
#define ADDRESS_ROW_MCP_B     0x21
uint8_t COL_LINE_PINS        [ 5] = { 32, 19, 33, 25, 5 /* 5 goes to 2 on PCB */ };  // Column Lines COL_A0...COL_A4
uint8_t E_LINE_PINS          [ 5] = { 16, 26, 17, 27, 23 };  // E Lines E1...E5
static const uint8_t D_PIN        = 18;
static const uint8_t LED_PIN      = 14;
static const uint8_t MCP_RESET    = 13;

// Create global display instance
LAWODisplay<ADDRESS_ROW_MCP_Y, ADDRESS_ROW_MCP_B, COL_LINE_PINS, E_LINE_PINS, D_PIN> d;

void setup() {
  Serial.begin(57600);
  delay(500);
  Serial.println();


  d.init();

  d.clear();


 
}

void loop() {
}
