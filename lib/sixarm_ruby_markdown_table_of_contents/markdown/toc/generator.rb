# -*- coding: utf-8 -*-
=begin rdoc
=end

module Markdown; module TOC; class Generator

  attr_accessor :settings

  def initialize(
    settings: Markdown::TOC::Settings.new
    )
    @settings = settings
  end

  def headline_to_markdown(headline)
    settings.indent + ("  " * (headline.level - 2)) + settings.bullet + " " + headline.link + "\n"
  end

  def scan_headlines(markdown_string)
    headlines = []
    markdown_string.scan(settings.headline_regexp).each{|markers, text| 
      level = markers.length
      if  level <= settings.depth 
        headlines << Headline.new(level: level, text: text)
      end
    }
    return headlines
  end

  def create_toc(markdown_string)
    return scan_headlines(markdown_string).map{|headline| headline_to_markdown(headline)}.join
  end

  def rewrite_toc(markdown_string)
    m = markdown_string.match(settings.contents_regexp)
    return m ? m.pre_match + create_toc(markdown_string) + m.post_match : nil
  end

end; end; end
