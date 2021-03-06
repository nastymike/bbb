module BBB
  module Pins
    class PWMPin
      include Pinnable

      %w(duty polarity period run).each do |method|
        define_method("#{method}=".to_sym) do |value|
          io.write(method.to_sym, value.to_i)
        end

        define_method(method.to_sym) do
          io.read(method.to_sym)
        end
      end

      def period_hz(herz)
        self.period = 1/herz*10e9
      end

      private

      def default_io
        IO::PWM.new(position)
      end

      class MockIO < StringIO
        def write(symbol, value)
          super(value)
        end

        def read(symbol)
          rewind
          super().to_i
        end
      end

      def mock_io
        MockIO.new
      end

    end
  end
end
