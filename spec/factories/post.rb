FactoryGirl.define do
    factory :post do
        title "Post Title"
        body "Post bodies must be pretty long."
        user #user method (user factory) creates a user for the post
        topic { Topic.create(name: 'Topic name') } #since no topic factory we need to create one
    end
end

