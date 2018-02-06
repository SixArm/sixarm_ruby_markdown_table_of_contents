# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe Markdown::String do

  describe "#new" do

    it "ok" do
      expect(Markdown::String.new).must_be_kind_of(Markdown::String)
    end

  end

end
