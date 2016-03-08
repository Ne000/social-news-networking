if Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
        address:         'smtp.sendgrid.net',
        port:            '465',
        authentication:  :plain,
        user_name:       ENV['SENGIRD_USERNAME'],
        password:        ENV['SENDGIRD_PASSWORD'],
        domain:          'heroku.com',
        enable_starttls_auto: true
    }
end
     
    