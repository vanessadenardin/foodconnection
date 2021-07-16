
puts 'destroying old records'

User.destroy_all

puts 'seeding started'
puts 'creating user 1'

user1 = User.create(username: 'testaccount', email: 'test@test.com', password: "123456", password_confirmation: "123456")

puts "Created User"
puts 'Creating recipes user 1'

# recipe = 
# 3.times do 
# 	user1.recipes.create(
recipe = Recipe.create(
    recipe_name: "test1",
    recipe_instructions: "test1test1test1test1test1",
    cooking_time: 30,
    serves: 2,
    skill_level: "beginners",
    cuisine: "Indian",
    meal_type: "breakfast",
    user: User.last
)

recipe = Recipe.create(
    recipe_name: "test2",
    recipe_instructions: "test2test2test2test2test2",
    cooking_time: 30,
    serves: 2,
    skill_level: "beginners",
    cuisine: "Indian",
    meal_type: "breakfast",
    user: User.last
)

recipe = Recipe.create(
    recipe_name: "test3",
    recipe_instructions: "test3test3test3test3test3",
    cooking_time: 30,
    serves: 2,
    skill_level: "beginners",
    cuisine: "Indian",
    meal_type: "breakfast",
    user: User.last
)


puts recipe.errors.full_messages unless recipe.valid?

# Recipe.create(
#     recipe_name: "test2",
#     recipe_instructions: "test2",
#     cooking_time: 60,
#     serves: 4,
#     skill_level: "intermediate",
#     cuisine: "Mexican",
#     meal_type: "lunch",
#     user_id: User.last
# )

puts "Created Recipes!"

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