module Rouge
  module Formatters
    class Prawn < Formatter
      tag 'prawn'

      def initialize opts = {}
        @theme = ::PrawnRougeFormatter::RougeThemeFinder.call(opts)
        @linenum_fragment_base = create_fragment(
          Tokens::Generic::Lineno
        ).merge(linenum: true)
      end

      # Override format method so fragments don't get flatted to a string
      # and to add an options Hash.
      def format tokens, opts = {}
        stream tokens, opts
      end

      def stream tokens, opts = {}
        start_of_line = true
        tokens.map do |tok, val|
          # match one or more consecutive endlines
          if val == LF || (val == (LF * val.length))
            start_of_line = true
            { text: val }
          else
            val[0] = GuardedIndent if start_of_line && (val.start_with? ' ')
            val.gsub! InnerIndent, GuardedInnerIndent if val.include? InnerIndent
            # QUESTION do we need the call to create_fragment if val contains only spaces? consider bg
            #fragment = create_fragment tok, val
            fragment = val.rstrip.empty? ? { text: val } : create_fragment(tok, val)
            # NOTE we assume if the fragment ends in a line feed, the intention was to match a line-oriented form
            fragment[:line_oriented] = true if (start_of_line = val.end_with? LF)
            fragment
          end
        end
      end

      def create_linenum_fragment linenum
        @linenum_fragment_base.merge text: %(#{linenum} )
      end

      private

      def create_fragment(token, value = nil)
        PrawnRougeFormatter::Fragment.call(
          token: token, theme: @theme, value: value
        )
      end
    end
  end
end
