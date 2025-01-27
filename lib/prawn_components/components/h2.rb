module PrawnComponents
  module Components
    module H2
      def h2(value, options = {})
        callback = options.key?(:callback) ? options[:callback] : lambda { |x| x }
        font_size = options.fetch(:font_size, 18)
        font_family = options.fetch(:font_family, 'Helvetica')

        font(font_family) do
          text(callback.call(value), size: font_size, style: :bold, inline_format: true)
        end
        move_down(10)
      end
    end
  end
end
