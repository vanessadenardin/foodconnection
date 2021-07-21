
puts 'destroying old records'

User.destroy_all

puts 'seeding started'
puts 'creating user 1'

user1 = User.create(username: 'testaccount', email: 'test@test.com', password: "123456", password_confirmation: "123456")

puts "Created User"
puts 'Creating recipes user 1'

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

puts "Created Recipes user 1!"

user2 = User.create(username: 'testaccount2', email: 'test2@test.com', password: "345678", password_confirmation: "345678")

puts "Created User 2"
puts 'Creating recipes user 2'

recipe = Recipe.create(
    recipe_name: "test4",
    recipe_instructions: "test4test4test4test4test4",
    cooking_time: 30,
    serves: 2,
    skill_level: "beginners",
    cuisine: "Indian",
    meal_type: "breakfast",
    user: User.last
)

recipe = Recipe.create(
    recipe_name: "test5",
    recipe_instructions: "test5test5test5test5test5",
    cooking_time: 30,
    serves: 2,
    skill_level: "beginners",
    cuisine: "Indian",
    meal_type: "breakfast",
    user: User.last
)

recipe = Recipe.create(
    recipe_name: "test6",
    recipe_instructions: "test6test6test6test6test6",
    cooking_time: 30,
    serves: 2,
    skill_level: "beginners",
    cuisine: "Indian",
    meal_type: "breakfast",
    user: User.last
)

puts recipe.errors.full_messages unless recipe.valid?

puts "Created Recipes user 2!"

puts 'creating user 3 admin'

user1 = User.create(username: 'testaccount3', email: 'test3@test.com', password: "testadmin", password_confirmation: "testadmin", admin: true)

puts "Created User 3 ADMIN"

puts 'Creating Ratings'

rating = Rating.create(
    rating: 3,
    review: "This is a test rating of a recipe",
    date: Time.now,
    user: User.last,
    recipe: Recipe.last
)

puts 'Ratings Created'

gluten = DietaryCategory.create(
    name: "Gluten Free"
)

dairy = DietaryCategory.create(
    name: "Dairy Free"
)

msg = DietaryCategory.create(
    name: "Contain MSG"
)

nuts = DietaryCategory.create(
    name: "Contain Nuts"
)

fodmap = DietaryCategory.create(
    name: "FODMAPs Found"
)

lactose = DietaryCategory.create(
    name: "Lactose Free"
)

vegetarian = DietaryCategory.create(
    name: "Vegetarian"
)

vegan = DietaryCategory.create(
    name: "Vegan"
)

paleo = DietaryCategory.create(
    name: "Paleo"
)

halal = DietaryCategory.create(
    name: "Halal"
)

puts 'Dietary_categories Created'

puts 'seeding complete'
