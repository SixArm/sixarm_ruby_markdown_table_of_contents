# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe Markdown::String do

  include Let

  describe "#toc" do

    it "return the toc" do
      expect(markdown_input_as_markdown_string.toc).must_equal(markdown_output_toc_as_markdown_string)
    end

  end

end
