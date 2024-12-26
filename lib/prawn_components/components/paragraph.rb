module PrawnComponents
  module Components
    module Paragraph
      def paragraph(value, options = {})
        font_size = options.fetch(:font_size, 13)

        text(value, size: font_size, inline_format: true, align: :justify)
        move_down(10)
      end
    end
  end
end
