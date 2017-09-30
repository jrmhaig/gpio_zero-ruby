require 'ffi'

class GpioZero
  class Pins
    class PiGpio
      extend FFI::Library
      ffi_lib '/usr/lib/libpigpiod_if2.so'

      class ConnectionError < StandardError; end

      def initialize host: 'localhost', port: 8888
        @pi = _pigpio_start host, port.to_s
        raise ConnectionError if @pi < 0
      end

      def set_mode pin, mode
        _set_mode @pi, pin, mode
      end

      def write pin, state
        _gpio_write @pi, pin, state ? 1 : 0
      end

      def read pin
        (_gpio_read @pi, pin) == 1
      end

      def revision
        _get_hardware_revision @pi
      end

      private
      attach_function :_pigpio_start, :pigpio_start, [ :string, :string ], :int
      attach_function :_set_mode, :set_mode, [ :int, :int, :int ], :int
      attach_function :_gpio_write, :gpio_write, [ :int, :int, :int ], :int
      attach_function :_gpio_read, :gpio_write, [ :int, :int ], :int
      attach_function :_get_hardware_revision, :get_hardware_revision, [ :int ], :int
    end
  end
end
