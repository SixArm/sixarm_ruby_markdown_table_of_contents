# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name           = "sixarm_ruby_markdown_table_of_contents"
  s.summary        = "SixArm.com → Ruby → Mardown table of contents"
  s.description    = "Generate a Markdown table of contents via headlines, links, and anchors"
  s.version        = "3.1.0"

  s.author         = "SixArm"
  s.email          = "sixarm@sixarm.com"
  s.homepage       = "http://sixarm.com/"
  s.licenses       = ["Apache-2.0", "Artistic-2.0", "BSD-3-Clause", "CC-BY-NC-SA-4.0", "AGPL-3.0", "EPL-1.0", "GPL-2.0", "GPL-3.0", "LGPL-3.0", "MIT", "MPL-2.0", "Ruby"]

  s.signing_key    =  "/opt/keys/sixarm/sixarm-rsa-4096-x509-20180113-private.pem"
  s.cert_chain     = ["/opt/keys/sixarm/sixarm-rsa-4096-x509-20180113-public.pem"]

  s.platform       = Gem::Platform::RUBY
  s.require_path   = "lib"


  s.files = [
    "Rakefile",
    "lib/sixarm_ruby_markdown_table_of_contents.rb",
    "lib/sixarm_ruby_markdown_table_of_contents/sixarm/markdown/toc/generator.rb",
    "lib/sixarm_ruby_markdown_table_of_contents/sixarm/markdown/toc/settings.rb",
  ]

  s.test_files = [
    "test/sixarm_ruby_markdown_table_of_contents_test.rb",
    "test/sixarm_ruby_markdown_table_of_contents_test/sixarm/markdown/toc/generator_test.rb",
    "test/sixarm_ruby_markdown_table_of_contents_test/sixarm/markdown/toc/settings_test.rb",
    "test/support/let.rb",
  ]

  s.executables = ["markdown-table-of-contents"]

  s.add_dependency("sixarm_ruby_markdown", ">= 3.1.0", "< 4")
  s.add_dependency("sixarm_ruby_file_rewrite", ">= 2", "< 3")

  s.add_development_dependency("minitest", ">= 5.11.3", "< 6")
  s.add_development_dependency("sixarm_ruby_minitest_extensions", ">= 1.0.8", "< 2")
  s.add_development_dependency("rake", ">= 12.3.1", "< 13")
  s.add_development_dependency("simplecov", ">= 0.16.1", "< 2")
  s.add_development_dependency("flog", ">= 4.6.2", "< 5")
  s.add_development_dependency("flay", ">= 2.12.0", "< 3")
  s.add_development_dependency("reek", ">= 4.8.1", "< 5")
  s.add_development_dependency('rubycritic', '>= 3.4.0', '< 4')
  s.add_development_dependency('rubocop', '>= 0.57.2', '< 1')

  s.required_ruby_version = ">= 2.5"

end
