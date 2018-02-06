# SixArm.com → Ruby → <br> Markdown table of contents gem

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_markdown_table_of_contents.svg)](http://badge.fury.io/rb/sixarm_ruby_markdown_table_of_contents)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_markdown_table_of_contents.png)](https://travis-ci.org/SixArm/sixarm_ruby_markdown_table_of_contents)
[![Code Climate](https://codeclimate.com/github/SixArm/sixarm_ruby_markdown_table_of_contents.png)](https://codeclimate.com/github/SixArm/sixarm_ruby_markdown_table_of_contents)
[![Coverage Status](https://coveralls.io/repos/SixArm/sixarm_ruby_markdown_table_of_contents/badge.svg?branch=master&service=github)](https://coveralls.io/github/SixArm/sixarm_ruby_markdown_table_of_contents?branch=master)

* Git: <https://github.com/sixarm/sixarm_ruby_markdown_table_of_contents>
* Doc: <http://sixarm.com/sixarm_ruby_markdown_table_of_contents/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_markdown_table_of_contents>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [Changes](CHANGES.md), [License](LICENSE.md), [Contributing](CONTRIBUTING.md).

<!--header-shut-->

## Introduction

Update a markdown file by autogenerating a table of contents
based on the markdown headlines.

Syntax:

    markdown-toc-generator <file>

Example:

    markdown-toc-generator example.md

Limits:

  * This does H2 headlines and lesser; this does not do H1 headlines.

  * This needs each headline anchor href to be unique; this does not auto-number them.



<!--install-opent-->

## Install

### Gem

Run this command in your shell or terminal:

gem install sixarm_ruby_markdown_table_of_contents

Or add this to your Gemfile:

    gem 'sixarm_ruby_markdown_table_of_contents'

### Require

To require this gem in your code:

    require 'sixarm_ruby_markdown_table_of_contents'

<!--install-shut-->



## How it works

The command parses the Markdown file using GitHub's HTML pipeline.

Example Markdown headline:

    ## Hello World

The pipeline generates a headline anchor href string:

    hello-world

The command creates a markdown list item:

    * [Hello World](#hello-world)

The command searches the text for the abbreviation "TOC:"
that starts a line, and is on the line by itself.

    TOC:

The command replaces successive non-blank lines with the markdown list items:

    TOC:
    * [Hello World](#hello-world)


## Demo

Demonstration Markdown file text, before the generator:

    # Demo

    TOC:
      
    ## Alpha

    Lorem ipsum

    ### Bravo
    
    Lorem ipsum

    ## Charlie

    Lorem ipsum

    ### Delta

    Lorem ipsum

Example Markdown file text, after the generator:

    # Demo

    TOC:
    * [Alpha](#alpha)
      * [Bravo](#bravo)
    * [Charlie](#charlie)
      * [Delta](#delta)
      
    ### Bravo
    
    Lorem ipsum

    ## Charlie

    Lorem ipsum

    ### Delta

    Lorem ipsum

Example of how GitHub renders the file, approximately:

    <h1>Demo</h1>

    TOC:
    <ul>
      <li><a href="#alpha">Alpha</a></li>
      <li>
        <ul>
          <li><a href="#bravo">Bravo</a></li>
        </ul>
      </li>
      <li><a href="#charlie">Charlie</a></li>
      <li>
        <ul>
          <li><a href="#Delta">Delta</a></li>
        </ul>
      </li>
    </ul>
 
    <h2><a class="anchor" href="#alpha" id="user-content-alpha">Alpha</a></h2>

    Lorem ipsum

    <h3><a class="anchor" href="#bravo" id="user-content-bravo">Bravo</a></h2>
    
    Lorem ipsum

    <h2><a class="anchor" href="#charlie" id="user-content-charlie">Charlie</a></h2>

    Lorem ipsum

    <h3><a class="anchor" href="#delta" id="user-content-delta">Delta</a></h2>

    Lorem ipsum

The GitHub automatic rendering typically adds more information, 
such as an SVG anchor image that shows/hides during hover.


## Tracking

* Command: markdown-table-of-contents
* Version: 1.8.0
* Created: 2018-02-04
* Updated: 2018-02-06
* License: Open source as described in the file LICENSE.md
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)

