#!/usr/bin/env python

import time

from gpiozero import Button

import board
import neopixel
import numpy as np

# LED strip configuration:
LED_COUNT   = 13      # Number of LED pixels.
LED_PIN     = board.D18      # GPIO pin
LED_BRIGHTNESS = 1  # LED brightness
LED_ORDER = neopixel.GRBW # order of LED colours. May be GRB, RGB, GRBW, or RGBW
delaytime = 2	# seconds to wait between color switching

# Create NeoPixel object with appropriate configuration.
strip = neopixel.NeoPixel(LED_PIN, LED_COUNT, brightness = LED_BRIGHTNESS, auto_write=False, pixel_order = LED_ORDER)


strip.fill((255,0,0,0))
strip.show()
time.sleep(delaytime)

strip.fill((0,255,0,0))
strip.show()
time.sleep(delaytime)

strip.fill((0,0,255,0))
strip.show()
time.sleep(delaytime)

strip.fill((0,0,0,255))
strip.show()
time.sleep(delaytime)

strip.fill((255,255,255,255))
strip.show()
time.sleep(delaytime)

strip.fill((0,0,0,0))
strip.show()
