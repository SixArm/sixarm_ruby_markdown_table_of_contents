# -*- coding: utf-8 -*-
=begin rdoc
=end

class Headline < OpenStruct

  def link
    "[#{text}](##{anchor})"
  end

  def anchor
    text.downcase.gsub(/\W+/,'-')
  end

end
