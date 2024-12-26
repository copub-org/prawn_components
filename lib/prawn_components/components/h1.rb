module PrawnComponents
  module Components
    module H1
      def h1(value, options = {})
        callback = options.key?(:callback) ? options[:callback] : lambda { |x| x }
        font_size = options.fetch(:font_size, 20)
        stroke_color = options.fetch(:stroke_color, 'F2F5F8')
        font_family = options.fetch(:font_family, 'Helvetica')

        font(font_family) do
          text(callback.call(value), size: font_size, style: :bold, inline_format: true)
        end

        stroke do
          move_down(10)
          stroke_color(stroke_color)
          line_width(1)
          horizontal_line(0, 540)
        end

        move_down(20)
      end
    end
  end
end
