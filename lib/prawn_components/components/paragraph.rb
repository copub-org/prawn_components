module PrawnComponents
  module Components
    module Paragraph
      def paragraph(value)
        text(value, size: 13, inline_format: true, align: :justify)
        move_down(10)
      end
    end
  end
end
