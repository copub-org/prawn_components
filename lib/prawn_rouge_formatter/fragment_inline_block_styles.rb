module PrawnRougeFormatter
  class FragmentInlineBlockStyles
    LineOrientedTokens = [
      ::Rouge::Token::Tokens::Generic::Inserted,
      ::Rouge::Token::Tokens::Generic::Deleted,
      ::Rouge::Token::Tokens::Generic::Heading,
      ::Rouge::Token::Tokens::Generic::Subheading
    ]

    def self.call(options:, token:, rules:)
      if LineOrientedTokens.include? token
        options[:inline_block] = true unless rules[:inline_block] == false
        options[:extend] = true unless rules[:extend] == false
      else
        options[:inline_block] = true if rules[:inline_block]
        options[:extend] = true if rules[:extend]
      end

      options
    end
  end
end
