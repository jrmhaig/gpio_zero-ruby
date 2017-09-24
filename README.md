# GPIO Zero for Ruby

## Quick setup

Ruby 2.3.3 is installed by default on the Raspberry Pi but there are a couple
of other packages required:

```
sudo apt install ruby-bundler ruby-dev
```

To be able to install gems without root access it is necessary to set the
location of gem files:

```
cat export GEM_PATH=~/.gems >> ~/.bashrc
```

### Alternative setup

To use the latest version of Ruby a version manager such as
[RVM](https://rvm.io/rvm/install) can be used. Note that this will build Ruby
from source and on a Raspbery Pi version before 3 can take (literally) hours.

The RVM installer doesn't quite set itself up properly for Linux. This can be
fixed with:

```
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" >> ~/.bashrc
```

## First steps

GPIO Zero depends on the pigpgiod daemon and so this need to be started first:

```
sudo /usr/bin/pigpiod
```

After that connect an LED up to pin 4 and try:

```
bundle install
bundle exec ruby test.rb
```

## Documentation

* [Basic recipes](doc/basic_recipes.md)

## Current features

Start using GPIO Zero:

```
gpio = GpioZero.new
```

Set a pin with default on or off:

```
output_pin_on  = gpio.output_device(4, initial_value: true)
output_pin_off = gpio.output_device(5, initial_value: false)
```

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

## References

This project is based on the Python
[GPIO Zero](https://gpiozero.readthedocs.io/en/stable/) libraries.
