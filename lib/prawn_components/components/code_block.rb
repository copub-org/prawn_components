module PrawnComponents
  module Components
    module CodeBlock
      def code_block(value, language)
        formatter = Rouge::Formatters::Prawn.new
        lexer = get_lexer(language)

        default_leading(5)
        span(540) do
          move_down(5)
          span(520, position: 10) do
            move_down(10)
            font 'Consolas' do
              formatted_text(formatter.format(lexer.new.lex(value)))
            end
          end

          move_down(30)
        end

        default_leading(5)
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
