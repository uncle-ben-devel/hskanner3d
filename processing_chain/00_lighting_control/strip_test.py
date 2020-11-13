#!/usr/bin/env python

from time import sleep
import board
import neopixel

# LED strip configuration:
LED_COUNT   = 13      # Number of LED pixels.
LED_PIN     = board.D18      # GPIO pin
LED_BRIGHTNESS = 1  # LED brightness
LED_ORDER = neopixel.GRBW # order of LED colours. May be GRB, RGB, GRBW, or RGBW
delaytime = 0.75	# seconds to wait between color switching

# Create NeoPixel object with appropriate configuration.
strip = neopixel.NeoPixel(LED_PIN, LED_COUNT, brightness = LED_BRIGHTNESS, auto_write=False, pixel_order = LED_ORDER)

def striptest():
    global strip
    strip.fill((128,0,0,0))
    strip.show()
    sleep(delaytime)

    strip.fill((255,0,0,0))
    strip.show()
    sleep(delaytime)

    strip.fill((0,128,0,0))
    strip.show()
    sleep(delaytime)

    strip.fill((0,255,0,0))
    strip.show()
    sleep(delaytime)

    strip.fill((0,0,128,0))
    strip.show()
    sleep(delaytime)

    strip.fill((0,0,255,0))
    strip.show()
    sleep(delaytime)

    strip.fill((0,0,0,128))
    strip.show()
    sleep(delaytime)

    strip.fill((0,0,0,255))
    strip.show()
    sleep(delaytime)

    strip.fill((128,128,128,128))
    strip.show()
    sleep(delaytime)

    strip.fill((255,255,255,255))
    strip.show()
    sleep(delaytime)

try:
    striptest()
except:
    print("An error occured or the execution of this script was cancelled.")
finally:
    strip.fill((0,0,0,0))
    strip.show()
