# -*- coding: utf-8 -*-
=begin rdoc
=end

class Markdown::File < ::File

  def slurp
    Markdown::String.new(read.scrub)
  end

  def rewrite_toc(markdown_toc_generator = Markdown::TOC::Generator.new)
    rewrite(markdown_toc_generator.rewrite_toc(slurp))
  end

end
