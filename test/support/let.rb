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
    ##### Delta
    XXX
  }

  let(:markdown_input_pre_match_as_string){ 
    <<~XXX
    # Example
    
    XXX
  }

  let(:markdown_input_toc_match_as_string){ 
    <<~XXX
    * [](#)
    XXX
  }

  let(:markdown_input_post_match_as_string){ 
    <<~XXX

    ## Alpha
    ### Bravo
    #### Charlie
    ##### Delta
    XXX
  }


  let(:markdown_default_output_as_string){
    <<~XXX
    # Example

    * [Alpha](#alpha)
      * [Bravo](#bravo)
        * [Charlie](#charlie)
          * [Delta](#delta)

    ## Alpha
    ### Bravo
    #### Charlie
    ##### Delta
    XXX
  }

  let(:markdown_custom_output_as_string){
    <<~XXX
    # Example

    !  + [Bravo](#bravo)
    !    + [Charlie](#charlie)

    ## Alpha
    ### Bravo
    #### Charlie
    ##### Delta
    XXX
  }

  let(:markdown_default_output_toc_as_string){
    <<~XXX
    * [Alpha](#alpha)
      * [Bravo](#bravo)
        * [Charlie](#charlie)
          * [Delta](#delta)
    XXX
  }

  let(:markdown_custom_output_toc_as_string){
    <<~XXX
    !  + [Bravo](#bravo)
    !    + [Charlie](#charlie)
    XXX
  }

  let(:markdown_input_as_markdown_string){
    SixArm::Markdown::String.new(markdown_input_as_string)
  }

  let(:markdown_input_toc_match_as_markdown_string){
    SixArm::Markdown::String.new(markdown_input_toc_match_as_string)
  }

  let(:markdown_default_output_as_headlines){[
    SixArm::Markdown::Headline.new(level: 2, text: "Alpha"),
    SixArm::Markdown::Headline.new(level: 3, text: "Bravo"),
    SixArm::Markdown::Headline.new(level: 4, text: "Charlie"),
    SixArm::Markdown::Headline.new(level: 5, text: "Delta"),
  ]}

  let(:markdown_custom_output_as_headlines){[
    SixArm::Markdown::Headline.new(level: 3, text: "Bravo"),
    SixArm::Markdown::Headline.new(level: 4, text: "Charlie"),
  ]}

  let(:markdown_default_output_as_markdown_string){
    SixArm::Markdown::String.new(markdown_default_output_as_string)
  }

  let(:markdown_default_output_toc_as_markdown_string){
    SixArm::Markdown::String.new(markdown_default_output_toc_as_string)
  }

  let(:markdown_custom_output_as_markdown_string){
    SixArm::Markdown::String.new(markdown_custom_output_as_string)
  }
  let(:markdown_custom_output_toc_as_markdown_string){
    SixArm::Markdown::String.new(markdown_custom_output_toc_as_string)
  }

  let(:custom_bullet){ "+" }
  let(:custom_line_prefix){ "!" }
  let(:custom_headline_minimum_level){ 3 }
  let(:custom_headline_maximum_level){ 4 }

end
