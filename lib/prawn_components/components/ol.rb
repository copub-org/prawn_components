module PrawnComponents
  module Components
    module Ol
      def ol(value, options = {})
        value.each_with_index do |val, i|
          start_new_page if value.last != val && cursor.to_i < 64
          indent(31) do
            parsed_value = options.key?(:callback) ? options[:callback].call(val) : val
            text("#{i + 1}.\xC2\xA0\ #{parsed_value}", size: 13, inline_format: true, align: :justify)
          end

          move_down(5)
        end

        move_down(10)
      end
    end
  end
end
