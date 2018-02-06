# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe Markdown::String do

  include Let

  let(:s) { markdown_input_as_markdown_string }

  describe "#generate_toc" do

    it "return the toc" do
      expect(s.generate_toc).must_equal(markdown_output_toc_as_markdown_string)
    end

  end

  describe "#match_toc" do

    it "match on the first occurance of lines that look like a table of contents" do
      expect(s.match_toc).must_equal /(^ *\* \[.*?\]\(#.*?\) *\n)+/m
    end

  end

  describe "#refresh_toc" do

    it "refresh" do
      expect(s.refresh_toc).must_equal(markdown_output_as_markdown_string)
    end

  end

end
