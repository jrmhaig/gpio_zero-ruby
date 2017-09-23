require 'gpio_zero'

RSpec.describe GpioZero::OutputDevice do
  let(:gpio) { GpioZero.new driver: :mock }

  describe '#state' do
    it 'initiates false' do
      expect(gpio.output_device(2, initial_value: false).state).to be_falsey
    end
    it 'initiates true' do
      expect(gpio.output_device(2, initial_value: true).state).to be_truthy
    end
    it 'maintains the previous state' do
      gpio.output_device(2, initial_value: false)
      expect(gpio.output_device(2).state).to be_falsey
      gpio.output_device(2, initial_value: true)
      expect(gpio.output_device(2).state).to be_truthy
    end
  end
end
