# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe SixArm::Markdown::TOC do

  include Let
  let(:my_path){ Pathname.new(File.expand_path(File.dirname(__FILE__))) }
  let(:top_dir){ my_path.sub("/test/sixarm_ruby_markdown_table_of_contents_test/sixarm/markdown/toc/bin", "") }
  let(:file_path){ top_dir + "tempfile" }
  let(:command_path){ top_dir + "bin" + "markdown-table-of-contents" }
  let(:text){ "foo" }

  describe "rewrite" do

    before do
      file =  File.new(file_path, "w")
      file.write markdown_input_as_markdown_string
      file.close
    end

    it "rewrite" do
      # Preflight
      file = SixArm::Markdown::File.new(file_path)
      expect(file.slurp).must_equal(markdown_input_as_markdown_string)
      # Run
      run = "#{command_path} #{file_path}"
      system(run)
      # Postflight
      file = SixArm::Markdown::File.new(file_path)
      expect(file.slurp).must_equal(markdown_default_output_as_markdown_string)
    end

    after do
      File.delete(file_path)
    end

  end

end
