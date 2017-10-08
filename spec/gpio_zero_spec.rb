require 'gpio_zero'

RSpec.describe GpioZero do
  let(:gpio) { GpioZero.new driver: GPIO_PINS }

  describe '#output_device' do
    it 'creates an OutputDevice' do
      expect(gpio.output_device(2)).to be_an GpioZero::OutputDevice
    end
  end

  describe '#LED' do
    it 'creates an LED' do
      expect(gpio.LED(2)).to be_an GpioZero::LED
    end
  end

  describe '#data' do
    it 'returns the correct fields' do
      expect(gpio.data.keys).to match(
        [
          :model, :pcb_rev, :released, :soc, :manufacturer, :ram, :storage,
          :usb, :eth, :wifi, :bt, :csi, :dsi, :headers
        ]
      )
    end
  end
end
