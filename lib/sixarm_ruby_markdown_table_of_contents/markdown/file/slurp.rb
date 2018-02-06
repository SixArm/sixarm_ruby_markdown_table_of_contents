# -*- coding: utf-8 -*-
=begin rdoc
Markdown::File#slurp
=end

module Markdown

  class File < ::File

    def slurp
      Markdown::String.new(read.scrub)
    end

  end

end