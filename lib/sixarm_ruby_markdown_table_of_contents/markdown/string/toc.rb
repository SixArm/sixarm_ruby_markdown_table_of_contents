# -*- coding: utf-8 -*-
=begin rdoc
Markdown::String#refresh_toc
=end

module Markdown

  class String < ::String

     def toc
       return scan(/^(##+) +(.+)\n/).map{|level, text| 
         Headline.new(level: level.length, text: text).to_markdown 
       }.join
     end

  end

end
