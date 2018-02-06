# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe Markdown::TOC::Generator do

  include Let

  let(:default_settings){ Markdown::TOC::Settings.new }
  let(:custom_settings){ Markdown::TOC::Settings.new(depth: 3, indent: "!", bullet: "+") }
  let(:generator_with_default_settings) { Markdown::TOC::Generator.new(settings: default_settings) }
  let(:generator_with_custom_settings) { Markdown::TOC::Generator.new(settings: custom_settings) }
  let(:s) { markdown_input_as_markdown_string }
  let(:headline){ Headline.new(level: 3, text: "Hello World") }

  describe "#headline_to_markdown" do

    describe "with default settings" do

      it "return the headline, with a default prefix ``, with a two-space indent because the headline is level 3, with a default bullet `*`" do  
        g = generator_with_default_settings
        actual = g.headline_to_markdown(headline)
        expect = "  * [Hello World](#hello-world)\n"
        expect(actual).must_equal(expect)
        end

    end

    describe "with custom settings" do

      it "return the headline, with a custom prefix `!`, with a two-space indent because the headline is level 3, with a custom bullet `+`" do
        g = generator_with_custom_settings
        actual = g.headline_to_markdown(headline)
        expect = "!  + [Hello World](#hello-world)\n"
        expect(actual).must_equal(expect)
      end

    end

  end

  describe "#scan_headlines" do

    describe "with default settings" do

      it "return all headlines" do
        g = generator_with_default_settings
        actual = g.scan_headlines(s)
        expect = markdown_default_output_as_headlines
        expect(actual).must_equal(expect)
      end

    end

    describe "with custom settings" do

      it "return the headlines that have a level less than or equal to the settings depth" do
        g = generator_with_custom_settings
        actual = g.scan_headlines(s)
        expect = markdown_custom_output_as_headlines
        expect(actual).must_equal(expect)
      end

    end

  end

  describe "#create_toc" do

    describe "with default settings" do

      it "return the toc" do
        g = generator_with_default_settings
        actual = g.create_toc(s)
        expect = markdown_default_output_toc_as_markdown_string
        expect(actual).must_equal(expect)
      end

    end

    describe "with custom settings" do

      it "return the toc" do
        g = generator_with_custom_settings
        actual = g.create_toc(s)
        expect = markdown_custom_output_toc_as_markdown_string
        expect(actual).must_equal(expect)
      end
      
    end

  end

  describe "#rewrite_toc" do

    describe "with default settings" do

      it "rewrite" do
        g = generator_with_default_settings
        actual = g.rewrite_toc(s)
        expect = markdown_default_output_as_markdown_string
        expect(actual).must_equal(expect)
      end

    end

    describe "with custom settings" do

      it "rewrite" do
        g = generator_with_custom_settings
        expect = markdown_custom_output_as_markdown_string
        expect(g.rewrite_toc(s)).must_equal(expect)
      end

    end

  end


end
