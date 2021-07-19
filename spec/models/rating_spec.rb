require "rails_helper"

RSpec.describe Rating, :type => :model do

    it "has a valid factory" do
        rating = build(:rating)
        expect(rating).to be_valid
    end

    context "validations" do
        before(:each) do
          @rating = build(:rating)
        end
    
        it "is invalid without a rating score" do
          rating = build(:rating, rating: nil)
          expect(rating).to_not be_valid
        end

        it "is invalid without a review" do
            rating = build(:rating, review: nil)
            expect(rating).to_not be_valid
        end

        it "is invalid without a date" do
            rating = build(:rating, date: nil)
            expect(rating).to_not be_valid
        end

    end


end