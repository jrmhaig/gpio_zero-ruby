class GpioZero
  class Output
    def initialize pi, pin
      @pi = pi
      @pin = pin
      @pi.mode @pin, PI_OUTPUT
    end

    def on
      @pi.write @pin, 1
    end

    def off
      @pi.write @pin, 0
    end
  end
end
