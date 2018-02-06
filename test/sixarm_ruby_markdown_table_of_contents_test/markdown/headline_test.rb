# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe Headline do

  include Let

  let(:level){ 3 }
  let(:text){ "Hello World" }
  let(:headline){ Headline.new(level: level, text: text) }

  describe "#text" do

    it "return text" do
      expect(headline.text).must_equal "Hello World"
    end

  end

  describe "#level" do

    it "return level" do
      expect(headline.text).must_equal "Hello World"
    end

  end

  describe "#indent" do

    it "return indent, which is two spaces per level greater than H2" do
      expect(headline.indent).must_equal "  "
    end

  end

  describe "#anchor" do

    it "return anchor, which is the text as lowercase, and replacing every run of non-word characters with a dash" do
      expect(headline.anchor).must_equal "hello-world"
    end

  end

  describe "#link" do

    it "return link, which is the Markdown formatting of the text and anchor" do
      expect(headline.link).must_equal "[Hello World](#hello-world)"
    end

  end

  describe "#to_markdown" do

    it "return the headline table of contents entry, which is a bullet link, and ending newline" do
      expect(headline.to_markdown).must_equal "  * [Hello World](#hello-world)\n"
    end

  end

end
