# Bloccit

## Summary    
Bloccit is a Reddit replica built on Ruby on Rails. It lets Users post, comment, and vote on content.
I made it with the help of a mentor through the Bloc FullStack Web Development Apprenticeship.  

## Features
Posts are organized by topic and sorted by their rank (determined by age and number of votes)   
Users can       
* view public topics, posts, and comments       
* create accounts to view private topics and posts and create their own posts and comments       
* format their posts using Markdown      
* favorite posts they like and vote posts up or down       
* receive email notifications when there are new comments on a post they have favorited        
* upload images to use in their posts and as their avatar       
      

## Technologies    
Languages, Libraries, and Frameworks:    
* Ruby on Rails, jQuery, AJAX, Bootstrap   

Databases: 
* SQLite (Test, Development), PostgreSQL (Production)   

Development Tools, Gems and Methodologies:       
* Test-Driven Development: RSpec, Capybara, FactoryGirl        
* Faker for database seeding        
* Figaro to manage sensitive information        
* Devise for user authentication        
* Pundit for user authorization        
* SendGrid for email processing       
* CarrierWave for uploading files       
* MiniMagick to manipulate images and handle sizing       
* Redcarpet for Markdown formatting       
* Will_paginate for pagination       
* Amazon S3 for image storage       
* Fog to support Amazon S3    
* New Relic Analytics for real-time data tracking of app traffic   
    
## Deployment    
You can view the app on Heroku: [stacia-bloccit app](https://stacia-bloccit.herokuapp.com/)


