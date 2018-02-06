# -*- coding: utf-8 -*-
=begin rdoc
Markdown::File#refresh_toc
=end

class Markdown::File < ::File

  def slurp
    Markdown::String.new(read.scrub)
  end

  def rewrite_toc
    rewrite(slurp.refresh_toc)
  end

end
