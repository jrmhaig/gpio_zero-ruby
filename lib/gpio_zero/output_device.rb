class GpioZero
  class OutputDevice
    PI_INPUT  = 0
    PI_OUTPUT = 1

    def initialize pin, device, options = {}
      @pin = pin
      @device = device
      @device.set_mode @pin, PI_OUTPUT
      @device.write @pin, options[:initial_value] unless options[:initial_value].nil?
    end

    def state
      @device.read @pin
    end

    def on
      @device.write @pin, true
    end

    def off
      @device.write @pin, false
    end
  end
end
