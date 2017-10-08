class GpioZero
  class Pins
    class Mock
      def initialize host: 'localhost', port: 8888
        @states = []
        40.times { @states << false }
      end

      def set_mode pin, mode
      end

      def write pin, state
        @states[pin] = state
      end

      def read pin
        @states[pin]
      end

      def revision
        MOCK_REVISION
      end
    end
  end
end
