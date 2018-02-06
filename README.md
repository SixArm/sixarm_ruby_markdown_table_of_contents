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

  * This processes H2 headlines and lesser; this deliberately does not process H1 headlines.

  * This needs each headline anchor href to be unique; this deliberately does not do any disambiguation.



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

The command scans Markdown text for each Markdown headline, such as:

    ## Hello World

The command parses the headline to create a Markdown bullet list item link, such as:

    * [Hello World](#hello-world)

The command processes all the headlines into a Markdown bullet list, such as:

    * [Hello World](#hello-world)
    * [Your Headline Here](#your-headline-here)
    * [Foo Bar](#foo-bar)

The command searches for text that indicates a blank placeholder for a table of contents:

    * [](#)

The command replaces the blank placeholder with the Markdown bullet list.

Later on, you can run the command again, and the command will rescan the headlines, create a fresh Markdown bullet list, and replace the existing Markdown bullet list. 


## Technical specifics

The command does a search/replace for first occurence of this regular expression: `^\* \[.*?\]\(#.*?\)$` and continues until the regular expression doesn't match.

 which matches the blank placeholder and also matches an existing Markdown bullet list of links and anchors.


## Demo

Demonstration Markdown file text, before the generator:

    # My Demo Page

    * [](#)
      
    ## Alpha

    Lorem ipsum

    ### Bravo
    
    Lorem ipsum

    ## Charlie

    Lorem ipsum

    ### Delta

    Lorem ipsum

Example Markdown file text, after the generator:

    # My Demo Page

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
* Version: 2.1.0
* Created: 2018-02-04
* Updated: 2018-02-06
* License: Open source as described in the file LICENSE.md
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)

