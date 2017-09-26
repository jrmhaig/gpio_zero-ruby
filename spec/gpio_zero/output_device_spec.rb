require 'gpio_zero'

RSpec.describe GpioZero::OutputDevice do
  let(:gpio) { GpioZero.new driver: GPIO_PINS }

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

  describe '#on' do
    it 'sets the device to high' do
      dev = gpio.output_device(2, initial_value: false)
      dev.on
      expect(dev.state).to be_truthy
    end

    it 'keeps the device high' do
      dev = gpio.output_device(2, initial_value: true)
      dev.on
      expect(dev.state).to be_truthy
    end
  end

  describe '#off' do
    it 'sets the device to low' do
      dev = gpio.output_device(2, initial_value: true)
      dev.off
      expect(dev.state).to be_falsey
    end

    it 'keeps the device low' do
      dev = gpio.output_device(2, initial_value: false)
      dev.off
      expect(dev.state).to be_falsey
    end
  end
end
