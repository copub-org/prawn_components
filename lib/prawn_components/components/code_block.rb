module PrawnComponents
  module Components
    module CodeBlock
      def code_block(value, language, options = {})
        formatter = Rouge::Formatters::Prawn.new
        lexer = get_lexer(language)
        font_family = options.fetch(:font_family, 'Consolas')
        leading = options.fetch(:leading, 5)

        span(540) do
          move_down(5)
          span(520, position: 10) do
            move_down(10)
            font font_family do
              formatted_text(formatter.format(lexer.new.lex(value)), leading: leading)
            end
          end

          move_down(30)
        end
      end

      private

      def get_lexer(language)
        name = "Rouge::Lexers::#{language.capitalize}"
        Object.const_get(name)
      rescue NameError
        Rouge::Lexers::Ruby
      end
    end
  end
end
