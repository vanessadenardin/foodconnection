require "rails_helper"

RSpec.describe RecipesController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET recipe" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

    describe "POST recipe" do
      it "has a 200 status code" do
        post :recipes
        expect(response.status).to eq(200)
      end
    end

    describe "PATCH recipe" do
      it "has a 200 status code" do
        patch :recipes
        expect(response.status).to eq(200)
      end
    end

    describe "DELETE recipe" do
      it "has a 200 status code" do
        delete :recipes
        expect(response.status).to eq(200)
      end
    end

end
