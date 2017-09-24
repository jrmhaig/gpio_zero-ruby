# Basic Recipes

The following recipes demonstrate some of the capabilities of the GPIO Zero
library.

## Starting GPIO Zero

The GPIO Zero library needs to be required at the top of the file:

```
require 'gpio_zero'
```

and to start using the library create an instance:

```
gpio = GpioZero.new
```

All the devices are now available:

```
# Create a generic output device on pin 4
output = gpio.output_device 4
```

## Pin numbering

Like the Python library, this library uses Broadcom (BCM) pin number for the
GPIO pins, as opposed to physical (BOARD) numbering. See
[the Python documentation](https://gpiozero.readthedocs.io/en/stable/recipes.html#pin-numbering) for further explanation and a diagram.

## LED

Turn an LED on and off repeatedly:

```
require 'gpio_zero'

gpio = GpioZero.new
led = gpio.LED(17)

loop do
  led.on
  sleep 1
  led.off
  sleep 1
end
