# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.create({
  :id => 1,
  :title => 'A Brief History of Time',
  :synopsis => 'A Brif History of Time tells us about how the time was created by the law of the universe at the first time',
  :author => 'Stephen Hawking',
  :image => File.new(File.join(Rails.root, 'dummy_cover', 'brief_history_of_time.jpg'))
})  
