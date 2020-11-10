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
# effect config
comet_r = 255
comet_g = 255
comet_b = 255
comet_w = 255
sleeptime = 0.08    # change this value to adjust the speed of the effect. 0 is no wait in between cycles.
tail_len = 5 # the tail will consist of tail_len-1 leds, with one led leading with 100% of what was set for the rgb values.

# Create NeoPixel object with appropriate configuration.
strip = neopixel.NeoPixel(LED_PIN, LED_COUNT, brightness = LED_BRIGHTNESS, auto_write=False, pixel_order = LED_ORDER)

# effect
strip.fill((0,0,0,0))

def shoot_star(tail_len):
    for ii in range(LED_COUNT):
        strip.fill((0,0,0,0))
        for jj in range(tail_len):
            cc = (tail_len - jj) / (tail_len * (jj + 1))  # brightness factor for tail. Since brightness does not scale linearly, i chose (n-x)/(n*(x+1)) for scaling, where n is the tail length and x is the distance from the brightest LED.
            strip[(ii+LED_COUNT-jj) % LED_COUNT] = (int(comet_r*cc),int(comet_g*cc),int(comet_b*cc),int(comet_w*cc))
        time.sleep(sleeptime)
        strip.show()

try:
    while True:
        shoot_star(tail_len)
finally:
    strip.fill((0,0,0,0))
    strip.show()
