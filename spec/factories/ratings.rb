FactoryBot.define do

    factory :rating do
        rating { 4 }
        review { "These test tacos were the best meal I've ever cooked and tasked thanks"}
        date { Time.now }
        user_id { 12 }
        recipe_id { 1 }
    end

end