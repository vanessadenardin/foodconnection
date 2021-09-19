FactoryBot.define do

    factory :user do
        id { 12 }
        username { "rspectest" }
        email { "rspectest@email.com" }
        password { "testpassword" }
        password_confirmation { "testpassword" }
    end

end