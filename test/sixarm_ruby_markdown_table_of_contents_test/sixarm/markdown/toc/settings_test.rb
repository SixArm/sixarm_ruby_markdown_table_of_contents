# -*- coding: utf-8 -*-
require "sixarm_ruby_markdown_table_of_contents_test"

describe SixArm::Markdown::TOC::Settings do

  include Let

  let(:settings){ SixArm::Markdown::TOC::Settings.new }

  def argv(*strings)
    ARGV.clear.append(*strings)
  end

  describe "#initialize" do

    describe "with defaults" do

      it "return default headline regexp" do
        x = SixArm::Markdown::TOC::Settings::DefaultHeadlineRegexp
        expect(SixArm::Markdown::TOC::Settings.new.headline_regexp).must_equal x
      end

      it "return default contents regexp" do
        x = SixArm::Markdown::TOC::Settings::DefaultContentsRegexp
        expect(SixArm::Markdown::TOC::Settings.new.contents_regexp).must_equal x
      end

      it "return default bullet" do
        x = SixArm::Markdown::TOC::Settings::DefaultBullet
        expect(SixArm::Markdown::TOC::Settings.new.bullet).must_equal x
      end

      it "return default headline minimum level" do
        x = SixArm::Markdown::TOC::Settings::DefaultHeadlineMinimumLevel
        expect(SixArm::Markdown::TOC::Settings.new.headline_minimum_level).must_equal x
      end

      it "return default headline maximum level" do
        x = SixArm::Markdown::TOC::Settings::DefaultHeadlineMaximumLevel
        expect(SixArm::Markdown::TOC::Settings.new.headline_maximum_level).must_equal x
      end

      it "return default line_prefix" do
        x = SixArm::Markdown::TOC::Settings::DefaultLinePrefix
        expect(SixArm::Markdown::TOC::Settings.new.line_prefix).must_equal x
      end

    end

    describe "with options" do

      it "return custom headline regexp" do
        x = /x/
        expect(SixArm::Markdown::TOC::Settings.new(headline_regexp: x).headline_regexp).must_equal x
      end

      it "return custom contents regexp" do
        x = /x/
        expect(SixArm::Markdown::TOC::Settings.new(contents_regexp: x).contents_regexp).must_equal x
      end

      it "return custom bullet" do
        x = custom_bullet
        expect(SixArm::Markdown::TOC::Settings.new(bullet: x).bullet).must_equal x
      end

      it "return custom line_prefix" do
        x = custom_line_prefix
        expect(SixArm::Markdown::TOC::Settings.new(line_prefix: x).line_prefix).must_equal x
      end

      it "return custom headline minimum level" do
        x = custom_headline_minimum_level
        expect(SixArm::Markdown::TOC::Settings.new(headline_minimum_level: x).headline_minimum_level).must_equal x
      end

      it "return custom headline maximum level" do
        x = custom_headline_maximum_level
        expect(SixArm::Markdown::TOC::Settings.new(headline_maximum_level: x).headline_maximum_level).must_equal x
      end

    end

  end

  describe "#option_parsing" do 

    describe "bullet" do

      before do
        @x = custom_bullet 
      end

      it "parse short" do
        argv("-b", @x)
        settings.option_parsing
        expect(settings.bullet).must_equal @x
      end

      it "parse long" do
        argv("--bullet", @x)
        settings.option_parsing
        expect(settings.bullet).must_equal @x
      end

    end

    describe "line prefix" do

      before do
        @x = custom_line_prefix
      end

      it "parse short" do
        argv("-l", @x)
        settings.option_parsing
        expect(settings.line_prefix).must_equal @x
      end

      it "parse long" do
        argv("--line-prefix", @x)
        settings.option_parsing
        expect(settings.line_prefix).must_equal @x
      end

    end

    describe "headline minimum level" do

      before do
        @x = custom_headline_minimum_level
      end

      it "parse" do
        argv("--min", @x.to_s)
        settings.option_parsing
        #expect(settings.headline_minimum_level).must_equal @x
      end
      
    end

    describe "headline maxmimum level" do

      before do
        @x = custom_headline_maximum_level
      end

      it "parse" do
        argv("--max", @x.to_s)
        settings.option_parsing
        expect(settings.headline_maximum_level).must_equal @x
      end
      
    end

    describe "help" do

      it "parse short" do
        argv("-h")
        settings.option_parsing  #TODO remove when the line below works
        #proc { settings.option_parsing }.must_output "hello"
      end

      it "parse long" do
        argv("--help")
        proc { settings.option_parsing }#.must_output "hello"  #TODO
      end
      
    end

    describe "version" do

      it "parse short" do
        argv("-v")
        proc { settings.option_parsing }#.must_output /^\d+\.\d+\.\d+/  #TODO
      end

      it "parse long" do
        argv("--version")
        proc { settings.option_parsing }#.must_output /^\d+\.\d+\.\d+/  #TODO
      end
      
    end
    
  end

end
