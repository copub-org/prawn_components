lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'prawn_components/version'

Gem::Specification.new do |s|
  s.add_development_dependency 'pry'
  s.add_runtime_dependency 'prawn', '>= 2.2.2'
  s.add_runtime_dependency 'prawn-table', '>= 0.2.2'
  s.add_runtime_dependency 'rouge', '3.30.0'
  s.add_runtime_dependency 'redcarpet', '3.6.0'
  s.name        = 'prawn_components'
  s.version     = PrawnComponents::Version
  s.date        = '2024-11-17'
  s.summary     = "Craft beautiful PDFs with Prawn and components"
  s.description = "Craft beautiful PDFs with Prawn and components"
  s.authors     = ["Paweł Dąbrowski"]
  s.email       = 'contact@paweldabrowski.com'
  s.files       = Dir['lib/**/*.rb', 'fonts/*.ttf', 'fonts/*.otf']
end
