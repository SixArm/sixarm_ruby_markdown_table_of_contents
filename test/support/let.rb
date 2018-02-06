# -*- coding: utf-8 -*-
require 'minitest/spec'

module Let

  extend Minitest::Spec::DSL

  let(:markdown_input_as_string){ 
    <<~XXX
    # Example

    Contents:

    ## Alpha

    Lorem ipsum

    ### Bravo

    Lorem ipsum

    #### Charlie

    Lorem ipsum

    ## Delta

    Lorem ipsum

    ### Echo

    Lorem ipsum

    #### Foxtrot

    Lorem ipsum

    XXX
  }

  let(:markdown_output_as_string){
    <<~XXX
    # Example

    Contents:
    * [Alpha](#alpha)
      * [Bravo](#bravo)
        * [Charlie](#charlie)
    * [Delta](#delta)
      * [Echo](#echo)
        * [Foxtrot](#foxtrot)

    ## Alpha

    Lorem ipsum

    ### Bravo

    Lorem ipsum

    #### Charlie

    Lorem ipsum

    ## Delta

    Lorem ipsum

    ### Echo

    Lorem ipsum

    #### Foxtrot

    Lorem ipsum

    XXX
  }

  let(:markdown_output_toc_as_string){
    <<~XXX
    * [Alpha](#alpha)
      * [Bravo](#bravo)
        * [Charlie](#charlie)
    * [Delta](#delta)
      * [Echo](#echo)
        * [Foxtrot](#foxtrot)
    XXX
  }

  let(:markdown_input_as_markdown_string){
    Markdown::String.new(markdown_input_as_string)
  }

  let(:markdown_output_as_markdown_string){
    Markdown::String.new(markdown_output_as_string)
  }

  let(:markdown_output_toc_as_markdown_string){
    Markdown::String.new(markdown_output_toc_as_string)
  }

end
