# -*- coding: utf-8 -*-
=begin rdoc
Markdown::String#refresh_toc
=end

module Markdown

  class String < ::String

    def generate_toc
      return scan(/^(##+) +(.+)\n/).map{|level, text| 
        Headline.new(level: level.length, text: text).to_markdown 
      }.join
    end

    def match_toc
      /(^ *\* \[.*?\]\(#.*?\) *\n)+/m
    end

    def refresh_toc
      m = match(match_toc)
      return m ? m.pre_match + generate_toc + m.post_match : nil
    end

  end

end
