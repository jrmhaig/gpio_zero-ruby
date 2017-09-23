# GPIO Zero for Ruby

An attempt to create GPIO Zero
[GPIO Zero](https://github.com/joan2937/pigpio) for Ruby. Very basic at the
moment!

## Getting started

I haven't worked out how to automatically start pigpiod so it has to be started
with:

```
/usr/bin/pigpiod
```

After that connect an LED up to pin 4 and try:

```
bundle install
bundle exec ruby test.rb
```

## Current features

None yet

## To do

Essentially, everything that exists in the Python GPIO Zero library, but in the
short term the following features appear in the 'Basic Recipes' section of the
documentation, ordered in (approximate) order of priority:

* LED
* Button
* PWMLED
* Buzzer
* RGBLED
* MotionSensor
* LightSensor
* DistanceSensor
* Motor
* CPUTemperature
* LEDBoard
* LEDBarGraph
* TrafficLights
* FishDish
* TrafficHat
* Robot
* MCP3008
* Energenie
* TimeOfDay
* PingServer
* tools.negated

For simplity, and as far as possible, the naming convention will follow the
names in the Python libraries.
