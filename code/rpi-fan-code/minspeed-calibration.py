#!/usr/bin/python
# -*- coding: utf-8 -*-

# File: minspeed-calibration.py
# Author: Pelochus
# Brief: Calibrates your minimum fan speed 

import RPi.GPIO as GPIO
import time
import sys

# Change FAN_PIN if different GPIO is used
FAN_PIN = 22
PWM_FREQ = 25

GPIO.setmode(GPIO.BCM)
GPIO.setup(FAN_PIN, GPIO.OUT, initial=GPIO.LOW)
fan = GPIO.PWM(FAN_PIN, PWM_FREQ)
fan.start(0);

print("\n#####################################################################################")
print("This script is used to calibrate your minimum fan speed\n")
print("To do this insert various values until the fan starts spinning\n")
print("Once done, write your value in the main Python file (values should be around 20-40%)\n")
print("USE CTRL+C TO QUIT\n")
print("#####################################################################################")

time.sleep(5)

try:
    while 1:
        fanSpeed = float(input("Fan Speed (%): "))
        fan.ChangeDutyCycle(fanSpeed)

except(KeyboardInterrupt):
    print("Fan Control interrupted by keyboard")
    GPIO.cleanup()
    sys.exit()
