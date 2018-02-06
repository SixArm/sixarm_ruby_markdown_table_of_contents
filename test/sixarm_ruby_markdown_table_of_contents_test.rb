# -*- coding: utf-8 -*-
require "minitest/autorun"
#require "minitest/benchmark" if ENV["BENCH"]
require "coveralls"
require "simplecov"
Coveralls.wear!
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
])
SimpleCov.start
require "sixarm_ruby_markdown_table_of_contents"

require_relative "support/let"