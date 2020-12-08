# Purpose
#   This script controls an RGBW-Strip with the data_in line attached to GPIO 18 on a Raspberry Pi.. All LEDs will be at the same user defined values.
####
# Usage
#   python3.7 all_set.py <int red_value> <int green_value> <int blue_value> <int white_value> <int number_leds>
#   color values can be 0...255 only.
#!/usr/bin/env python

import board
import neopixel
from sys import argv

# LED strip configuration:
LED_COUNT   = int(argv[5])      # Number of LED pixels.
LED_PIN     = board.D18      # GPIO pin
LED_BRIGHTNESS = 1
LED_ORDER = neopixel.GRBW # order of LED colours. May be GRB, RGB, GRBW, or RGBW

# Create NeoPixel object with appropriate configuration.
strip = neopixel.NeoPixel(LED_PIN, LED_COUNT, brightness = LED_BRIGHTNESS, auto_write=False, pixel_order = LED_ORDER)

strip.fill((int(argv[1]),int(argv[2]),int(argv[3]),int(argv[4])))
strip.show()
