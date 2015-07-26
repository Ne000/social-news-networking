module ApplicationHelper
    def form_group_tag(errors, &block) #& turns block into a Proc object- reusable block
        if errors.any?
            content_tag :div, capture(&block), class: 'form-group has-error'
            #method taks symbol arg.,a block, and options. Creates the symbol-specific html tag with block contents.
        else
            content_tag :div, capture(&block), class: 'form-group'
        end
    end
    
    def markdown_to_html(markdown)
        renderer = Redcarpet::Render::HTML.new
        extensions = {fenced_code_blocks: true}
        redcarpet = Redcarpet::Markdown.new(renderer, extensions)
        (redcarpet.render markdown).html_safe
    end
end
# defining a method that takes two arguments. 1st is an array of errors, 2nd is block
#