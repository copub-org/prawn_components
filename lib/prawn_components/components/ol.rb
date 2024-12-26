module PrawnComponents
  module Components
    module Ol
      def ol(value, options = {})
        indentation_level = options.fetch(:indentation_level, 31)
        font_size = options.fetch(:font_size, 13)

        value.each_with_index do |val, i|
          start_new_page if value.last != val && cursor.to_i < 64
          indent(indentation_level) do
            parsed_value = options.key?(:callback) ? options[:callback].call(val) : val
            text("#{i + 1}.\xC2\xA0\ #{parsed_value}", size: font_size, inline_format: true, align: :justify)
          end

          move_down(5)
        end

        move_down(10)
      end
    end
  end
end
