# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'destroying old records'

User.destroy_all

puts 'seeding started'
puts 'creating user 1'

user1 = User.create(username: 'testaccount', email: 'test@test.com', password_digest: '123456')

puts "Created User"
puts 'Creating recipes user 1'

# Recipe.create(
#     recipe_name: "test",
#     recipe_instructions: "hello",
#     cooking_time: 2,
#     serves: 2,
#     skill_level: "beginners",
#     cuisine: "Indian",
#     meal_type: "breakfast",
#     user: User.last
# )

# puts "Created Recipe!"

3.times do 
	user1.recipes.create(
	recipe_name: ['test recipe', 'testy recipe', 'testytesty recipe'].sample,
	recipe_instructions: ['Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...', 
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec purus magna. Curabitur at venenatis ipsum. Phasellus pulvinar est vel dolor tempor tristique.', 
        'Aliquam erat volutpat. Phasellus pharetra posuere sem, eget scelerisque lorem auctor sollicitudin. Mauris lobortis mollis risus ut tempor.'].sample,
	cooking_time: [1,2,3,4].sample,
	serves: [1,2,4,6].sample,
    skill_level: ['beginners', 'intermediate', 'advanced', 'chef'].sample,
	cuisine: ['western', 'mexican', 'italian', 'brazilian'].sample,
	meal_type: ['breakfast', 'lunch', 'dinner', 'dessert', 'snack'].sample
	)
end

# puts 'creating user 2'

# user2 = User.create(username: 'testaccount2', email: 'test2@test.com', password_digest: '123123')

# puts 'creating recipes user 2'

# 3.times do 
# 	user2.recipes.create(
# 	recipe_name: ['test recipe', 'testy recipe', 'testytesty recipe'].sample,
# 	recipe_instructions: ['Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...', 
#         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec purus magna. Curabitur at venenatis ipsum. Phasellus pulvinar est vel dolor tempor tristique.', 
#         'Aliquam erat volutpat. Phasellus pharetra posuere sem, eget scelerisque lorem auctor sollicitudin. Mauris lobortis mollis risus ut tempor.'].sample,
# 	cooking_time: [1,2,3,4].sample,
# 	serves: [1,2,4,6].sample,
#     skill_level: ['beginners', 'intermediate', 'advanced', 'chef'].sample,
# 	cuisine: ['western', 'mexican', 'italian', 'brazilian'].sample,
# 	meal_type: ['breakfast', 'lunch', 'dinner', 'dessert', 'snack'].sample
# 	)
# end

puts 'seeding complete'