module PrawnRougeFormatter
  class NormalizeColor
    def self.fetch(code)
      return unless code

      normalized = (code.start_with? '#') ? code[1..-1] : code
      normalized = normalized.each_char.map {|c| c * 2 }.join if normalized.length == 3
      normalized
    end
  end
end
