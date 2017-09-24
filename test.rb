require 'gpio_zero'

gpio = GpioZero.new

led = gpio.LED 4
5.times do
  led.on
  sleep 1
  led.off
  sleep 1
end
