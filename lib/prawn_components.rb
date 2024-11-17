require 'prawn/table'
require 'prawn'
require 'rouge'

require_relative 'prawn_rouge_formatter/fragment'
require_relative 'prawn_rouge_formatter/fragment_inline_block_styles'
require_relative 'prawn_rouge_formatter/fragment_styles'
require_relative 'prawn_rouge_formatter/rouge_theme_finder'
require_relative 'prawn_rouge_formatter/normalize_color'
require_relative 'prawn_rouge_formatter/rouge_theme_finder'
require_relative 'prawn_rouge_formatter/parser_configuration'
require_relative 'rouge/formatters/prawn'

require_relative 'prawn_components/components/h1'
require_relative 'prawn_components/components/h2'
require_relative 'prawn_components/components/h3'
require_relative 'prawn_components/components/h4'
require_relative 'prawn_components/components/paragraph'
require_relative 'prawn_components/components/code_block'
require_relative 'prawn_components/components/quote'
require_relative 'prawn_components/components/ul'
require_relative 'prawn_components/components/ol'
require_relative 'prawn_components/components/table_of_contents'

Prawn::Document.class_eval do
  include PrawnComponents::Components::H1
  include PrawnComponents::Components::H2
  include PrawnComponents::Components::H3
  include PrawnComponents::Components::H4
  include PrawnComponents::Components::Paragraph
  include PrawnComponents::Components::CodeBlock
  include PrawnComponents::Components::Quote
  include PrawnComponents::Components::Ul
  include PrawnComponents::Components::Ol
  include PrawnComponents::Components::TableOfContents
end

module PrawnComponents
  class << self
    def initialize_fonts(pdf:)
      dir = Gem::Specification.find_by_name('prawn_components').gem_dir
      fonts_dir = "#{dir}/fonts/"

      pdf.font_families.update(
        "Helvetica" => {
          bold: "#{fonts_dir}Helvetica-Bold.ttf",
          italic: "#{fonts_dir}Helvetica-Oblique.ttf",
          normal: "#{fonts_dir}Helvetica.ttf"
        }
      )

      pdf.font_families.update(
        "Consolas" => { 
          bold: "#{fonts_dir}consolab.ttf",
          italic: "#{fonts_dir}consolai.ttf",
          normal: "#{fonts_dir}consola.ttf"
        }
      )

      pdf.font_families.update(
        "Georgia" => { 
          bold: "#{fonts_dir}georgia-bold.ttf",
          italic: "#{fonts_dir}georgia-italic.ttf",
          normal: "#{fonts_dir}georgia.ttf"
        }
      )

      pdf.font_families.update(
        "Inter" => { 
          bold: "#{fonts_dir}Inter-Bold.ttf",
          normal: "#{fonts_dir}Inter-Regular.ttf",
          italic: "#{fonts_dir}Inter-Italic.otf"
        }
      )
    end
  end
end
