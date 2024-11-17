module PrawnComponents
  module Components
    module H2
      def h2(value, options = {})
        callback = options.key?(:callback) ? options[:callback] : lambda { |x| x }

        font('Helvetica') do
          text(callback.call(value), size: 18, style: :bold, inline_format: true)
        end
        move_down(10)
      end
    end
  end
end
