# -*- coding: utf-8 -*-
=begin rdoc
Markdown::File#refresh_toc
=end

module Markdown

  class File < ::File

    def refresh_toc(toc = nil, toc_start = nil, toc_stop = nil, offset = nil)
      input = slurp
      output = input.refresh_toc(toc, toc_start, toc_stop, offset)
      rewrite(output)
    end

  end

end