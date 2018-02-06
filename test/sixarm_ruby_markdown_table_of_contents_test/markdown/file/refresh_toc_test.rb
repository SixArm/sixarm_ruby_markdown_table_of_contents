# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe Markdown::File do

  include Let
  let(:dir){ File.expand_path File.dirname(__FILE__) }
  let(:file_path){ dir + "tempfile"}

  describe "#refresh_toc" do

    before do
      file =  Markdown::File.new(file_path, "w")
      file.write markdown_input_as_markdown_string
      file.close
    end

    it "refresh" do
      file =  Markdown::File.new(file_path)
      file.refresh_toc
      file =  Markdown::File.new(file_path)
      expect(file.slurp).must_equal(markdown_output_as_markdown_string)      
      file.close
    end

  end

end
