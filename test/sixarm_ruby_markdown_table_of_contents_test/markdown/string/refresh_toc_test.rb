# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe Markdown::String do

  include Let

  describe "#refresh_toc" do

    it "refresh" do
      expect(markdown_input_as_markdown_string.refresh_toc).must_equal(markdown_output_as_markdown_string)
    end

  end

end
