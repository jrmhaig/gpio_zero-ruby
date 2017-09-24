require 'gpio_zero'

gpio = GpioZero.new
puts 'Pin 4 on'
gpio.output_device(4, initial_value: true)
sleep 2
puts 'Pin 4 off'
gpio.output_device(4, initial_value: false)
sleep 2
