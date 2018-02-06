# -*- coding: utf-8 -*-
require 'minitest/spec'

module Let

  extend Minitest::Spec::DSL

  let(:markdown_input_as_string){ 
    <<~XXX
    # Example

    * [](#)

    ## Alpha
    ### Bravo
    #### Charlie
    ## Delta
    ### Echo
    #### Foxtrot
    XXX
  }

  let(:markdown_input_pre_match_as_string){ 
    <<~XXX
    # Example
    
    XXX
  }

  let(:markdown_input_toc_as_string){ 
    <<~XXX
    * [](#)
    XXX
  }

  let(:markdown_input_post_match_as_string){ 
    <<~XXX

    ## Alpha
    ### Bravo
    #### Charlie
    ## Delta
    ### Echo
    #### Foxtrot
    XXX
  }


  let(:markdown_default_output_as_string){
    <<~XXX
    # Example

    * [Alpha](#alpha)
      * [Bravo](#bravo)
        * [Charlie](#charlie)
    * [Delta](#delta)
      * [Echo](#echo)
        * [Foxtrot](#foxtrot)

    ## Alpha
    ### Bravo
    #### Charlie
    ## Delta
    ### Echo
    #### Foxtrot
    XXX
  }

  let(:markdown_custom_output_as_string){
    <<~XXX
    # Example

    !+ [Alpha](#alpha)
    !  + [Bravo](#bravo)
    !+ [Delta](#delta)
    !  + [Echo](#echo)

    ## Alpha
    ### Bravo
    #### Charlie
    ## Delta
    ### Echo
    #### Foxtrot
    XXX
  }

  let(:markdown_default_output_toc_as_string){
    <<~XXX
    * [Alpha](#alpha)
      * [Bravo](#bravo)
        * [Charlie](#charlie)
    * [Delta](#delta)
      * [Echo](#echo)
        * [Foxtrot](#foxtrot)
    XXX
  }

  let(:markdown_custom_output_toc_as_string){
    <<~XXX
    !+ [Alpha](#alpha)
    !  + [Bravo](#bravo)
    !+ [Delta](#delta)
    !  + [Echo](#echo)
    XXX
  }

  let(:markdown_input_as_markdown_string){
    Markdown::String.new(markdown_input_as_string)
  }

  let(:markdown_input_toc_as_markdown_string){
    Markdown::String.new(markdown_input_toc_as_string)
  }

  let(:markdown_default_output_as_headlines){[
    Headline.new(level: 2, text: "Alpha"),
    Headline.new(level: 3, text: "Bravo"),
    Headline.new(level: 4, text: "Charlie"),
    Headline.new(level: 2, text: "Delta"),
    Headline.new(level: 3, text: "Echo"),
    Headline.new(level: 4, text: "Foxtrot"),
  ]}

  let(:markdown_custom_output_as_headlines){[
    Headline.new(level: 2, text: "Alpha"),
    Headline.new(level: 3, text: "Bravo"),
    Headline.new(level: 2, text: "Delta"),
    Headline.new(level: 3, text: "Echo"),
  ]}

  let(:markdown_default_output_as_markdown_string){
    Markdown::String.new(markdown_default_output_as_string)
  }

  let(:markdown_default_output_toc_as_markdown_string){
    Markdown::String.new(markdown_default_output_toc_as_string)
  }

  let(:markdown_custom_output_as_markdown_string){
    Markdown::String.new(markdown_custom_output_as_string)
  }
  let(:markdown_custom_output_toc_as_markdown_string){
    Markdown::String.new(markdown_custom_output_toc_as_string)
  }

  
end
