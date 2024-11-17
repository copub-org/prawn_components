module PrawnRougeFormatter
  class FragmentStyles
    def self.call(rules:)
      styles = %i[italic underline].select { |s| rules[s] }
      return if styles.size.zero?

      styles.to_set
    end
  end
end
