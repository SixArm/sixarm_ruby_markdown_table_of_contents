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
      file = Markdown::File.new(file_path)
      s = file.slurp
      expect(s).must_equal text
      expect(s).must_be_kind_of Markdown::String
    end

    after do
      File.delete(file_path)
    end

  end

  describe "#rewrite_toc" do

    before do
      file =  Markdown::File.new(file_path, "w")
      file.write markdown_input_as_markdown_string
      file.close
    end

    it "rewrite" do
      file = Markdown::File.new(file_path)
      file.rewrite_toc
      file = Markdown::File.new(file_path)
      expect(file.slurp).must_equal(markdown_output_as_markdown_string)      
      file.close
    end

    after do
      File.delete(file_path)
    end

  end

end
