# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe Markdown::TOC::Settings do

  describe "#initialize" do

    describe "with defaults" do

      it "return default headline regexp" do
        expect(Markdown::TOC::Settings.new.headline_regexp).must_equal Markdown::TOC::Settings::DefaultHeadlineRegexp
      end

      it "return default contents regexp" do
        expect(Markdown::TOC::Settings.new.contents_regexp).must_equal Markdown::TOC::Settings::DefaultContentsRegexp
      end

      it "return default bullet" do
        expect(Markdown::TOC::Settings.new.bullet).must_equal Markdown::TOC::Settings::DefaultBullet
      end

      it "return default depth" do
        expect(Markdown::TOC::Settings.new.depth).must_equal Markdown::TOC::Settings::DefaultDepth
      end

      it "return default indent" do
        expect(Markdown::TOC::Settings.new.indent).must_equal Markdown::TOC::Settings::DefaultIndent
      end

    end

    describe "with options" do

      it "return custom headline regexp" do
        expect(Markdown::TOC::Settings.new(headline_regexp: /x/).headline_regexp).must_equal /x/
      end

      it "return custom contents regexp" do
        expect(Markdown::TOC::Settings.new(contents_regexp: /x/).contents_regexp).must_equal /x/
      end

      it "return custom bullet" do
        expect(Markdown::TOC::Settings.new(bullet: "+").bullet).must_equal "+"
      end

      it "return custom depth" do
        expect(Markdown::TOC::Settings.new(depth: 2).depth).must_equal 2
      end

      it "return custom indent" do
        expect(Markdown::TOC::Settings.new(indent: " ").indent).must_equal " "
      end

    end

  end

end
