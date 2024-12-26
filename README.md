# Prawn Components

Craft beautiful PDF documents with pre-defined components.

## Getting started

Install library:

```bash
gem install prawn_components
```

## Usage

Start with creating new document, initialize the fonts and use desired components:

```ruby
pdf = Prawn::Document.new
pdf.default_leading(10)

PrawnComponents.initialize_fonts(pdf: pdf)

pdf.h1('This is the most important header')
pdf.paragraph('Lorem ipsum!')
pdf.ul([
  'First item',
  'Second item',
  'Third item'
])

pdf.render_file('hello.pdf')
```

## Components

The following components are supported:

* Headers: `h1`, `h2`, `h3`, and `h4`.
* Paragraph: `paragraph`.
* Code with syntax highlighting: `code_block`.
* Lists: `ol` and `ul`.
* Other: `quote`, `table_of_contents`.

### Header - level 1

* Component: `h1`
* Options:
  * `callback`
  * `font_size` - 20 by default
  * `stroke_color` - `F2F5F8` by default
  * `font_family` - Helvetica by default

Usage:

```ruby
# without options
pdf.h1('Header')

# with options
pdf.h1('Header', font_size: 25)
```

### Header - level 2

* Component: `h2`
* Options:
  * `callback`
  * `font_size` - 18 by default
  * `font_family` - Helvetica by default

Usage:

```ruby
# without options
pdf.h2('Header')

# with options
pdf.h2('Header', font_size: 20)
```

### Header - level 3

* Component: `h3`
* Options:
  * `callback`
  * `font_size` - 16 by default
  * `font_family` - Helvetica by default

Usage:

```ruby
# without options
pdf.h3('Header')

# with options
pdf.h3('Header', font_size: 18)
```

### Header - level 4

* Component: `h4`
* Options:
  * `callback`
  * `font_size` - 14 by default
  * `font_family` - Helvetica by default

Usage:

```ruby
# without options
pdf.h3('Header')

# with options
pdf.h3('Header', font_size: 14)
```

### Paragraph

* Component: `paragraph`
* Options:
  * `font_size` - 13 by default

Usage:

```ruby
# without options
pdf.paragraph('Lorem ipsum')

# with options
pdf.paragraph('Lorem ipsum', font_size: 14)
```

### Code block

* Component: `code_block`
* Options:
  * `font_family` - Consolas by default
  * `leading` - 5 by default

Usage:

```ruby
# without options
pdf.code_block('def name = nil', 'ruby')

# with options
pdf.code_block('def name = nil', 'ruby', font_family: 'Helvetica')
```

### Ordered list

* Component: `ol`
* Options:
  * `font_size` - 13 by default
  * `indentation_level` - 31 by default

```ruby
# without options
pdf.ol([
  'First item',
  'Second item',
  'Third item'
])

# with options
pdf.ol([
  'First item',
  'Second item',
  'Third item'
], font_size: 14, indentation_level: 15)
```

### Unordered list

* Component: `ul`
* Options:
  * `font_size` - 13 by default
  * `indentation_level` - 31 by default

```ruby
# without options
pdf.ul([
  'First item',
  'Second item',
  'Third item'
])

# with options
pdf.ul([
  'First item',
  'Second item',
  'Third item'
], font_size: 14, indentation_level: 15)
```

### Quoute

* Component: `quote`
* Options:
  * `text_color` - `6A737D` by default
  * `border_color` - `DFE2E5` by default

```ruby
# without options
pdf.quote([
  'First line',
  'Second line',
  'Third line'
])

pdf.quote("First line\nSecond line\nThird line")

# with options
pdf.quote("First line\nSecond line\nThird line", text_color: 'DFE2E5')
```

### Table of contents

* Component: `table_of_contents`

Usage:

```ruby
pdf.table_of_contents(
  [
    [
      'Preface',
      {
        page: 1,
        headings: {
          'Introduction' => '2',
          'Chapter 1' => '3',
          'Chapter 2' => '4',
        }
      }
    ],
    [
      'Introduction',
      {
        page: 2,
        headings: {
          'Introduction' => '2',
          'Chapter 1' => '3',
          'Chapter 2' => '4',
        }
      }
    ]
  ]
)
```
