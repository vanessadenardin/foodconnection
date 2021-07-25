require "rails_helper"

RSpec.describe User, :type => :model do

  it "has a valid factory" do
    user = build(:user)
    expect(user).to be_valid
  end

  context "validations" do
    before(:each) do
      @user = build(:user)
    end

    it "is invalid without a username" do
      user = build(:user, username: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without an email" do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without a password" do
      user = build(:user, password: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without a password confirmation" do
      user = build(:user, password_confirmation: nil)
      expect(user).to_not be_valid
    end

    it "is invalid without an @ symbol" do
      user = build(:user, email: "suzatsuz.com")
      expect(user).to_not be_valid
    end

    it "is invalid without a .com on the email address" do
      user = build(:user, email: "suzsuz")
      expect(user).to_not be_valid
    end

  end

end