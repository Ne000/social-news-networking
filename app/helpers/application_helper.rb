module ApplicationHelper
    def form_group_tag(errors, &block) #& turns block into a Proc object- reusable block
        if errors.any?
            content_tag :div, capture(&block), class: 'form-group has-error'
            #method taks symbol arg.,a block, and options. Creates the symbol-specific html tag with block contents.
        else
            content_tag :div, capture(&block), class: 'form-group'
        end
    end
end
# defining a method that takes two arguments. 1st is an array of errors, 2nd is block
#