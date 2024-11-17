# pdf.v1_table_of_contents(
#   [
#     [
#       'Preface',
#       {
#         page: 1,
#         headings: {
#           'Introduction' => '2',
#           'Chapter 1' => '3',
#           'Chapter 2' => '4',
#         }
#       }
#     ],
#     [
#       'Introduction',
#       {
#         page: 2,
#         headings: {
#           'Introduction' => '2',
#           'Chapter 1' => '3',
#           'Chapter 2' => '4',
#         }
#       }
#     ]
#   ]
# )
module PrawnComponents
  module Components
    module TableOfContents
      def table_of_contents(value)
        value.each do |(chapter_title, data)|
          table_data = []
          start_page = data[:page]
          table_data << [
            { content: chapter_title, font_style: :bold }, 
            { content: start_page.to_s, font_style: :bold, align: :right }
          ]
          data[:headings].each do |(title, page)|
            str = "\xC2\xA0\xC2\xA0\xC2\xA0\xC2\xA0#{title}\xC2\xA0\xC2\xA0"
            line_size = 140
            1.upto(line_size - str.size) do |i|
              if i.odd?
                str << "."
              else
                str << "\xC2\xA0"
              end
            end
            length_indicator = data[:headings].keys.sort_by { |s| s.size }.reverse.first.size
            diff = length_indicator - title.size

            if diff > 0
              next_diff = diff
              next_diff = 2 if diff == 1
              1.upto(next_diff + 1) do |i|
                if i.odd?
                  str << "\xC2\xA0"
                else
                  str << "."
                end
              end
            end

            table_data << [
              { content: title }, 
              { content: page.to_s, align: :right }
            ]
          end

          table(table_data,
            cell_style: { border_width: 0, padding: [10, 10, 5, 10] },
            width: 560
          )
          move_down(30)
        end
      end
    end
  end
end
