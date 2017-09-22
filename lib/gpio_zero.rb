require 'ffi'
require 'gpio_zero/output'

class GpioZero
  extend FFI::Library
  ffi_lib '/usr/lib/libpigpiod_if2.so'

  attr_accessor :id

  PI_INPUT  = 0
  PI_OUTPUT = 1

  def initialize
    @id = pigpio_start 'localhost', '8888'
  end

  def stop
    pigpio_stop @id
  end

  def LED pin
    GpioZero::Output.new self, pin
  end

  def mode pin, mode
    set_mode @id, pin, mode
  end

  def write pin, value
    gpio_write @id, pin, value
  end

  private
  attach_function :pigpio_start, [ :string, :string ], :int
  attach_function :pigpio_stop, [ :int ], :int
  attach_function :set_mode, [ :int, :int, :int ], :int
  attach_function :gpio_write, [ :int, :int, :int ], :int
end
