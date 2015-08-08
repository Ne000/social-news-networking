FactoryGirl.define do
    factory :comment do
        body "This is a new comment"
        user
        post
        
        after(:buld) do |comment|
            comment.class.skip_callback(:create, :after, :send_favorite_emails)
        end
    end
end
#code run after comment is initialied but before it is saved so we can stub after-create behavior in spec