# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe Markdown::File do

  include Let
  let(:dir){ File.expand_path File.dirname(__FILE__) }
  let(:file_path){ dir + "tempfile"}
  let(:text){ "foo" } 

  describe "#slurp" do

    before do
      file = Markdown::File.new(file_path, "w")
      file.write(text)
      file.close      
    end

    it "read and scrub, and return a Markdown::String" do
      file = Markdown::File.new(file_path, "r")
      s = file.slurp
      expect(s).must_equal text
      expect(s).must_be_kind_of Markdown::String
    end

  end

end
