require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  describe "GET index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  # describe "GET show" do
  #   it "has a 200 status code" do
  #     get :user
  #     expect(response.status).to eq(200)
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "has a 200 status code" do
  #     delete :users
  #     expect(response.status).to eq(200)
  #   end
  # end

  describe "POST sign up" do
    it "has a 200 status code" do
      post :sign_up
      expect(response.status).to eq(200)
    end
  end

  describe "POST login" do
    it "has a 200 status code" do
      post :login
      expect(response.status).to eq(200)
    end
  end
end
