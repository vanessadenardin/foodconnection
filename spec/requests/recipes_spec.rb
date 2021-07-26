require 'rails_helper'

RSpec.describe "Recipes", type: :request do
    describe "GET /recipes" do 
        before(:each) do
            get '/recipes'
        end

        it "should respond with 200 ok" do
            expect(response).to have_http_status(200)
        end

        it "should respond with json" do
            expect(response.content_type).to eq("application/json; charset=utf-8")
        end
    end

end
