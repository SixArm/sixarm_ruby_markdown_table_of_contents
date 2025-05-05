# SixArm.com → Ruby → <br> Markdown table of contents gem

<img src="README.png" alt="Markdown table of contents" style="width: 100%;"/>

<!--header-open-->

[![Gem Version](https://badge.fury.io/rb/sixarm_ruby_markdown_table_of_contents.svg)](http://badge.fury.io/rb/sixarm_ruby_markdown_table_of_contents)
[![Build Status](https://travis-ci.org/SixArm/sixarm_ruby_markdown_table_of_contents.png)](https://travis-ci.org/SixArm/sixarm_ruby_markdown_table_of_contents)
[![Code Climate](https://api.codeclimate.com/v1/badges/d4fbc1f26882a200a1ca/maintainability)](https://codeclimate.com/github/SixArm/sixarm_ruby_markdown_table_of_contents/maintainability)

* Git: <https://github.com/SixArm/sixarm_ruby_markdown_table_of_contents>
* Doc: <http://sixarm.com/sixarm_ruby_markdown_table_of_contents/doc>
* Gem: <https://rubygems.org/gems/sixarm_ruby_markdown_table_of_contents>
* Contact: Joel Parker Henderson, <joel@sixarm.com>
* Project: [changes](CHANGES.md), [license](LICENSE.md), [contributing](CONTRIBUTING.md).

<!--header-shut-->

## Introduction

Update a markdown file by autogenerating a table of contents
based on the markdown headlines.

Syntax:

```terminal
markdown-table-of-contents [options] <file> ...
```

Example:

```terminal
markdown-table-of-contents example.md
```

Limits:

* This processes H2 headlines and lesser; this deliberately does not process H1 headlines.
* This needs each headline anchor href to be unique; this deliberately does not do any disambiguation.

Options:

* `-b --bullet STRING`: set the line bullet (default is "`*`")
* `-l --line-prefix STRING`: set the line prefix (default is "")
* `--min INTEGER`: set the headline minimum level (default is `2`, meaning H2 and higher; currently `1` does not work, as is a known issue)
* `--max INTEGER`: set the headline maximum level (default is `3`, meaning H3 and lower)
* `--headline-regex REGEXP`: set the headline regular expression
* `--contents-regex REGEXP`: set the contents regular expression

<!--install-open-->

## Install

### Gem

To install this gem in your shell or terminal:

```terminal
gem install sixarm_ruby_markdown_table_of_contents
```

### Gemfile

To add this gem to your Gemfile:

```terminal
gem 'sixarm_ruby_markdown_table_of_contents'
```

### Require

To require the gem in your code:

```ruby
require 'sixarm_ruby_markdown_table_of_contents'
```

<!--install-shut-->

## How it works

The command scans Markdown text for each Markdown headline, such as:

```markdown
## Hello World
```

The command parses the headline to create a Markdown bullet list item link, such as:

* [Introduction](#introduction)
* [Install](#install)
  * [Gem](#gem)
  * [Gemfile](#gemfile)
  * [Require](#require)
* [How it works](#how-it-works)
* [Technical specifics](#technical-specifics)
* [Demo](#demo)
* [Alternatives](#alternatives)
* [Tracking](#tracking)

The command processes all the headlines into a Markdown bullet list, such as:

```markdown
* [Hello World](#hello-world)
* [Your Headline Here](#your-headline-here)
* [Foo Bar](#foo-bar)
```

The command searches for text that indicates a blank placeholder for a table of contents:

```markdown
* [](#)
```

The command replaces the blank placeholder with the Markdown bullet list.

Later on, you can run the command again, and the command will rescan the headlines, create a fresh Markdown bullet list, and replace the existing Markdown bullet list. 

## Technical specifics

The command does a search/replace for first occurence of this regular expression: `^\* \[.*?\]\(#.*?\)$` and continues until the regular expression doesn't match.

 which matches the blank placeholder and also matches an existing Markdown bullet list of links and anchors.

## Demo

Demonstration Markdown file text, before the generator:

```markdown
# My Demo Page

* [](#)
  
## Alpha

### Bravo

#### Charlie

#### Delta
```

Example Markdown file text, after the generator:

```markdown
# My Demo Page

* [Alpha](#alpha)
  * [Bravo](#bravo)
    * [Charlie](#charlie)
      * [Delta](#delta)

## Alpha

### Bravo

#### Charlie

#### Delta
```

Example of how GitHub renders the file, approximately:

```html
<h1>Demo</h1>

TOC:
<ul>
  <li><a href="#alpha">Alpha</a></li>
  <li>
    <ul>
      <li><a href="#bravo">Bravo</a></li>
      <li>
        <ul>
          <li><a href="#charlie">Charlie</a></li>
          <li>
            <ul>
              <li><a href="#Delta">Delta</a></li>
            </ul>
          </li>
        </ul>
      </li>
    </ul>
  </li>
</ul>

<h2><a class="anchor" href="#alpha" id="user-content-alpha">Alpha</a></h2>

<h3><a class="anchor" href="#bravo" id="user-content-bravo">Bravo</a></h2>

<h4><a class="anchor" href="#charlie" id="user-content-charlie">Charlie</a></h2>

<h5><a class="anchor" href="#delta" id="user-content-delta">Delta</a></h2>
```

The GitHub automatic rendering typically adds more information,
such as an SVG anchor image that shows/hides during hover.

## Alternatives

There are other implementations for generating a table of contents in Markdown.
The VSCode extension [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) supports updating a TOC without requiring any markers.
One should configure the extension in VSCode to a) not updating the TOC during save and b) including levels 2..6 only.

## Tracking

* Command: markdown-table-of-contents
* Version: 3.1.0
* Created: 2018-02-04
* Updated: 2018-12-23
* License: Open source as described in the file [LICENSE.md](LICENSE.md)
* Contact: Joel Parker Henderson (joel@joelparkerhenderson.com)

<!-- markdownlint-disable-file MD033 -->
