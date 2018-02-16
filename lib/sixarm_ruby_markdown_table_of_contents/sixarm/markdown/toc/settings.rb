# -*- coding: utf-8 -*-
=begin rdoc
=end

require "optparse"

module SixArm; module Markdown; module TOC; end; end; end

class SixArm::Markdown::TOC:: Settings

  DefaultBullet = "*"
  DefaultLinePrefix = ""
  DefaultHeadlineMinimumLevel = 2
  DefaultHeadlineMaximumLevel = 6
  DefaultHeadlineRegexp = /^ *[#=]+ *.+? *[#=]* *\n/
  DefaultContentsRegexp = /(^ *\* \[.*?\]\(#.*?\) *\n)+/m

  attr_accessor \
    :bullet,
    :line_prefix,
    :headline_minimum_level,
    :headline_maximum_level,
    :headline_regexp,
    :contents_regexp

  def initialize(
    bullet: DefaultBullet, 
    line_prefix: DefaultLinePrefix,
    headline_minimum_level: DefaultHeadlineMinimumLevel, 
    headline_maximum_level: DefaultHeadlineMaximumLevel, 
    headline_regexp: DefaultHeadlineRegexp, 
    contents_regexp: DefaultContentsRegexp
    )
    self.headline_regexp = headline_regexp
    self.contents_regexp = contents_regexp
    self.bullet = bullet
    self.headline_minimum_level = headline_minimum_level 
    self.headline_maximum_level = headline_maximum_level 
    self.line_prefix = line_prefix
  end

  def option_parsing

    ::OptionParser.new do |o|  
        
      o.banner = "Usage: markdown-table-of-contents [options]"
      o.separator ""
      o.separator "Options:"

      o.on("-bBULLET", "--bullet BULLET", String, 
        "Set the bullet text",
        "(default is \"#{DefaultBullet}\" and other typical choices are \"+\" and \"-\")"
      ) do |x|
        self.bullet = x
      end

      o.on("-lLINE_PREFIX", "--line-prefix LINE_PREFIX", String, 
        "Set the line prefiix text",
        "(default is \"#{DefaultLinePrefix}\" and other typical choices are \"  \" and \"\t\")"
      ) do |x|
        self.line_prefix = x
      end

      o.on("--min NUMBER", Integer, 
        "Set the headline minimum level",
        "(default is \"#{DefaultHeadlineMinimumLevel}\" which means use H#{DefaultHeadlineMinimumLevel} and higher)"
      ) do |x|
        #self.headline_minimum_level = x
      end

      o.on("--max NUMBER", Integer,
        "Set the headline maxmium level",
        "(default is \"#{DefaultHeadlineMaximumLevel}\" which means use up to H#{DefaultHeadlineMaximumLevel})"
      ) do |x|
        self.headline_maximum_level = x
      end

      o.on("--headline-regexp REGEXP", Regexp,
        "Set the headline regular expression",
        "(default is #{DefaultHeadlineRegexp})"
      ) do |x|
        self.headline_regexp = x
      end
      
      o.on("--contents-regexp REGEXP", Regexp,
        "Set the contents regular expression",
        "(default is #{DefaultContentsRegexp})"
      ) do |x|
        self.contents_regexp = x
      end

      o.on_tail("-h", "--help", "Show this message") do
        #puts "Help is TODO"  #TODO
      end

      o.on_tail("--version", "Show version") do
        #puts "Version is TODO"  #TODO
      end

    end.parse!

  end

end