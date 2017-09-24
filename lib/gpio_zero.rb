require 'ffi'
require 'gpio_zero/output_device'
require 'gpio_zero/digital_output_device'
require 'gpio_zero/LED'

class GpioZero
  def initialize driver: :pi_gpio
    require "gpio_zero/pins/#{driver}"
    pin_class = 'GpioZero::Pins::' + driver.to_s.split('_').collect(&:capitalize).join
    @pins = Object.const_get(pin_class).new
  end

  def output_device pin, options = {}
    GpioZero::OutputDevice.new pin, @pins, options
  end

  def LED pin, options = {}
    GpioZero::LED.new pin, @pins, options
  end
end
