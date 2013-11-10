require 'spec_helper'

describe BBB::Components::Led do
  let(:led) {BBB::Components::Led.new}

  it "initializes off" do
    led.off?.should be_true
  end

  it "set state: on" do
    led.on!
    led.on?.should be_true
  end

  it "set state: off" do
    led.on!
    led.off!
    led.off?.should be_true
  end

  it "check state: on?" do
    led.off!
    led.on!
    led.on?.should be_true
  end

  it "provides access to state "do
    led.on!
    led.state.should eql(:high)
    led.off!
    led.state.should eql(:low)
  end

end
