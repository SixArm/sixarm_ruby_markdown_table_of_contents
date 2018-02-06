# -*- coding: utf-8 -*-
=begin rdoc
=end

module Markdown; module TOC; class Settings

  DefaultHeadlineRegexp = /^(##+) +(.+)\n/
  DefaultContentsRegexp = /(^ *\* \[.*?\]\(#.*?\) *\n)+/m
  DefaultBullet = "*"
  DefaultDepth = 6
  DefaultIndent = ""

  attr_accessor \
    :headline_regexp,
    :contents_regexp,
    :bullet,
    :depth,
    :indent

  def initialize(
    headline_regexp: DefaultHeadlineRegexp, 
    contents_regexp: DefaultContentsRegexp, 
    bullet: DefaultBullet, 
    depth: DefaultDepth, 
    indent: DefaultIndent
    )
    self.headline_regexp = headline_regexp
    self.contents_regexp = contents_regexp
    self.bullet = bullet
    self.depth = depth
    self.indent = indent
  end

end; end; end
