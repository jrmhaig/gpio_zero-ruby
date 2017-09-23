require 'ffi'
require 'gpio_zero/output_device'

class GpioZero
  extend FFI::Library
  ffi_lib '/usr/lib/libpigpiod_if2.so'

  attr_accessor :id

  PI_INPUT  = 0
  PI_OUTPUT = 1

  def initialize driver: :pi_gpio
    require "gpio_zero/pins/#{driver}"
    pin_class = 'GpioZero::Pins::' + driver.to_s.split('_').collect(&:capitalize).join
    @pins = Object.const_get(pin_class).new
  end

  def output_device pin, options = {}
    GpioZero::OutputDevice.new pin, @pins, options
  end
#
#  def stop
#    pigpio_stop @id
#  end
#
#  def LED pin
#    GpioZero::Output.new self, pin
#  end
#
#  def mode pin, mode
#    set_mode @id, pin, mode
#  end
#
#  def write pin, value
#    gpio_write @id, pin, value
#  end
#
#  private
#  attach_function :pigpio_start, [ :string, :string ], :int
#  attach_function :pigpio_stop, [ :int ], :int
#  attach_function :set_mode, [ :int, :int, :int ], :int
#  attach_function :gpio_write, [ :int, :int, :int ], :int
end
