module PrawnComponents
  module Components
    module H3
      def h3(value, options = {})
        callback = options.key?(:callback) ? options[:callback] : lambda { |x| x }

        font('Helvetica') do
          text(callback.call(value), size: 16, style: :bold, inline_format: true)
        end
        move_down(10)
      end
    end
  end
end
