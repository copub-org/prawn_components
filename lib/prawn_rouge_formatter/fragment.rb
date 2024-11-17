module PrawnRougeFormatter
  class Fragment
    def initialize(token, theme, value)
      @token = token
      @theme = theme
      @value = value
    end

    def self.call(token:, theme:, value: nil)
      new(token, theme, value).call
    end

    def call
      return default_fragment unless style_rules

      fragment = default_fragment

      # if (bg = PrawnRougeFormatter::NormalizeColor.fetch(style_rules.bg)) && bg != @background_color
        
      #   fragment[:background_color] = bg

      #   fragment = ::PrawnRougeFormatter::FragmentInlineBlockStyles.call(
      #     options: fragment, token: @token, rules: style_rules
      #   )
      # end

      if (fg = PrawnRougeFormatter::NormalizeColor.fetch(style_rules.fg))
        fragment[:color] = fg
      end

      if styles = PrawnRougeFormatter::FragmentStyles.call(rules: style_rules)
        fragment[:styles] = styles
      end

      fragment
    end

    private

    def default_fragment
      @value ? { text: @value, size: 13 } : {}
    end

    def style_rules
      @style_rules ||= @theme.style_for(@token)
    end
  end
end
