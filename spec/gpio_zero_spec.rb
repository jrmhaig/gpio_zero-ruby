require 'gpio_zero'

RSpec.describe GpioZero do
  let(:gpio) { GpioZero.new driver: :mock }

  describe '#output_device' do
    it 'creates an OutputDevice' do
      expect(gpio.output_device(2)).to be_an GpioZero::OutputDevice
    end
  end
end
