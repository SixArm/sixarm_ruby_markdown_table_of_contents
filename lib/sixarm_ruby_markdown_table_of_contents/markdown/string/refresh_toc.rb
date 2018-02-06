# -*- coding: utf-8 -*-
=begin rdoc
Markdown::String#refresh_toc
=end

module Markdown

  class String < ::String

    def refresh_toc(toc = nil, toc_start = nil, toc_stop = nil, offset = nil)
      toc ||= self.toc
      toc_start ||= /^Contents:\n/
      toc_stop ||= /^\n/
      offset ||= 0
      replace_between(toc, toc_start, toc_stop, offset)
    end

  end

end
