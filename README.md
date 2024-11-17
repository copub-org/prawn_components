# Prawn Components

Craft beautiful PDF documents with pre-defined components

## Getting started

Install library:

```bash
gem install prawn_components
```

## Usage

```ruby
pdf = Prawn::Document.new
pdf.default_leading(10)

PrawnComponents.initialize_fonts(pdf: pdf)

pdf.h1('Hello, World!')
pdf.h2('Hello, World!')
pdf.h3('Hello, World!')
pdf.h4('Hello, World!')

pdf.paragraph('Lorem ipsum!')

pdf.code_block("def hello\n  puts 'Hello, World!'\nend\n", 'ruby')

pdf.quote("This is my world\n\nTim Doe")

pdf.ul(['Tim Doe', 'Are are', 'Test'])

pdf.paragraph('Lorem ipsum!')

pdf.ol(['Tim Doe', 'Are are', 'Test'])

pdf.render_file('hello.pdf')
```
