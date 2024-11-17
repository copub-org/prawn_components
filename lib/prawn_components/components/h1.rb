module PrawnComponents
  module Components
    module H1
      def h1(value, options = {})
        callback = options.key?(:callback) ? options[:callback] : lambda { |x| x }

        font('Helvetica') do
          text(callback.call(value), size: 20, style: :bold, inline_format: true)
        end
        stroke do
          move_down 10
          stroke_color 'F2F5F8'
          line_width 1
          horizontal_line(0, 540)
        end
        move_down(20)
      end
    end
  end
end
