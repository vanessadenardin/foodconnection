FactoryBot.define do

    factory :user do
        id { 15 }
        username { "suztest15" }
        email { "suztest15@email.com" }
        password { "testpassword15" }
        password_confirmation { "testpassword15" }
    end

end