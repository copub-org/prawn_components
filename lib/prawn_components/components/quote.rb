module PrawnComponents
  module Components
    module Quote
      def quote(value, options = {})
        text_color = options.fetch(:text_color, '6A737D')
        border_color = options.fetch(:border_color, 'DFE2E5')

        callback = options.key?(:callback) ? options[:callback] : lambda { |x| x }
        parsed_value = if value.is_a?(Array)
          value.map { |e| [callback.call(e)] }
        else
          value.split("\n").map { |e| [callback.call(e)] }
        end

        quote_rows = parsed_value
        padding = [5, 0, 5, 15]
        border_width = 3

        table(quote_rows,
          cell_style: { 
            text_color: text_color, 
            borders: [:left], 
            border_color: border_color, 
            border_width: border_width, 
            padding: padding,
            inline_format: true
          }
        )
        move_down(20)
      end
    end
  end
end
