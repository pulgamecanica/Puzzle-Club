# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Puzzle -> Title, description, pieces, has-one_attached :image, start_date, end_date, 

user1 = Admin.create(email: "admin@admin.com", password: "admin123", password_confirmation: "admin123") #<Admin id: nil, email: "", created_at: nil, updated_at: nil>

puzzle1 = Puzzle.create(title: "Cats & Dogs", description: "Cats & Dogs by Ravensburger Animals collection", pieces: 1000, start_date: Time.now - 1.day, end_date: Time.now)
puzzle2 = Puzzle.create(title: "Guernica", description: "Guernica Puzzle by Educa, painting from Picasso", pieces: 1000, start_date: Time.now - 2.day, end_date: Time.now)
puzzle3 = Puzzle.create(title: "Unknown", description: "Unknown source", pieces: 1000, start_date: Time.now - 4.day, end_date: Time.now - 1.day)

memory = Memory.create(user_names42: "arosado- lame_user", puzzle: puzzle1)

textmem = TextMemory.create(title: "Amazing friends", description: "We put 1 pieces", memory: memory)

