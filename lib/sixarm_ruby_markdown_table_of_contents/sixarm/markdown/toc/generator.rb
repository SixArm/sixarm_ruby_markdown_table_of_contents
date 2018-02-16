# -*- coding: utf-8 -*-
=begin rdoc
=end

module SixArm; module Markdown; module TOC; end; end; end

class SixArm::Markdown::TOC::Generator

  attr_accessor :settings

  def initialize(
    settings: SixArm::Markdown::TOC::Settings.new
    )
    @settings = settings
  end

  def headline_to_markdown(headline)
    settings.line_prefix + ("  " * (headline.level - 2)) + settings.bullet + " " + headline.link + "\n"
  end

  def scan_headlines(markdown_string)
    headlines = []
    markdown_string.scan(settings.headline_regexp).each{|line| 
      headline = SixArm::Markdown::Headline::parse_line(line.chomp)
      if  headline.level >= settings.headline_minimum_level && headline.level <= settings.headline_maximum_level 
        headlines << headline
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

end
