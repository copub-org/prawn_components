Tokens = ::Rouge::Token::Tokens
LineOrientedTokens = [
  ::Rouge::Token::Tokens::Generic::Inserted,
  ::Rouge::Token::Tokens::Generic::Deleted,
  ::Rouge::Token::Tokens::Generic::Heading,
  ::Rouge::Token::Tokens::Generic::Subheading
]

LF = %(\n)
NoBreakSpace = %(\u00a0)
InnerIndent = %(\n )
GuardedIndent = %(\u00a0)
GuardedInnerIndent = %(\n\u00a0)
