module PrawnRougeFormatter
  class RougeThemeFinder
    # Use Github theme by default
    def initialize(options)
      @options = options
    end

    def self.call(options = {})
      new(options).call
    end

    def call(options = {})
      (theme || default_theme).new
    end

    private

    def default_theme
      ::Rouge::Themes::Github
    end

    def theme
      return unless @options[:theme]

      ::Rouge::Theme.find(@options[:theme])
    end
  end
end
