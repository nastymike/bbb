module BBB
  module IO
    ##
    # Credit goes to the great work done at the Artoo framework
    # The original idea for this class came from them.
    # https://github.com/hybridgroup/artoo/blob/master/lib/artoo/adaptors/io/digital_pin.rb
    #
    class DigitalPin
      attr_reader :pin_num, :mode, :pin_io, :status

      def initialize(pin_num, mode="r", pin_io=nil)
        @pin_num = pin_num
        @pin_io = pin_io || nil
        @mode = mode
      end

      # Writes to the specified pin Digitally
      # accepts values :high or :low
      def write(value)
        raise ArgumentError unless [:high, :low].include?(value)
        @status = value
        @pin_io.write(value)
        @pin_io.flush
      end

      # Reads digitally from the specified pin on initialize
      def read
        @pin_io.read
      end

      # Sets digital write for the pin to HIGH
      def on!
        write(:high)
      end
      #
      # Sets digital write for the pin to LOW
      def off!
        write(:low)
      end

      def on?
        (status == :high) ? true : false
      end

      def off?
        !self.on?
      end


    end
  end
end