# require "rails_helper"
# RSpec.describe User, :type => :model do
  
#   before(:all) do
#     @user2 = create(:user)
#   end
  
#   it "is valid with valid attributes" do
#     expect(@user1).to be_valid
#   end
  
#   it "has a unique username" do
#     user3 = build(:user, email: "suztest33@email.com")
#     expect(user3).to_not be_valid
#   end
  
#   it "has a unique email" do
#     user2 = build(:user, username: "suztest33@email.com")
#     expect(user3).to_not be_valid
#   end
  
#   it "is not valid without a password" do 
#     user2 = build(:user, password: nil)
#     expect(user3).to_not be_valid
#   end
  
#   it "is not valid without a username" do 
#     user2 = build(:user, username: nil)
#     expect(user3).to_not be_valid
#   end
  
#   it "is not valid without an email" do
#     user2 = build(:user, email: nil)
#     expect(user3).to_not be_valid
#   end
# end