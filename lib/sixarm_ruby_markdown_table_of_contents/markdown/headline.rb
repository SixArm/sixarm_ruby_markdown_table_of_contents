# -*- coding: utf-8 -*-
=begin rdoc
Headline
=end

class Headline < OpenStruct

  def to_markdown
    indent + "* " + link + "\n"
  end

  def indent
    level ? ("  " * (level - 2)) : ""
  end

  def link
    "[#{text}](##{anchor})"
  end

  def anchor
    text.downcase.gsub(/\W+/,'-')
  end

end
