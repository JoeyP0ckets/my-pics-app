# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Picture.destroy_all
Tag.destroy_all
Comment.destroy_all
PictureTag.destroy_all

10.times do
    User.create(username: Faker::Internet.username, email: Faker::Internet.email, password: Faker::Internet.password)
end 


10.times do
    Picture.create(image_url: Faker::Internet.url, title: Faker::Superhero.name, user_id:User.all.sample.id)
end 


10.times do
    Tag.create(name: Faker::Superhero.descriptor)
end 

10.times do 
    Comment.create(content: Faker::Books::Dune.quote, user_id:User.all.sample.id, picture_id:Picture.all.sample.id)
end

10.times do
    PictureTag.create(picture_id:Picture.all.sample.id, tag_id:Tag.all.sample.id)
end 
