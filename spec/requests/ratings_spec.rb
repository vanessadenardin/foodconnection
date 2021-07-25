require 'rails_helper'

RSpec.describe "Ratings", type: :request do
    describe "GET /ratings" do 
        before(:each) do
            get '/ratings'
        end

        it "should respond with 200 ok" do
            expect(response).to have_http_status(200)
        end

        it "should respond with json" do
            expect(response.content_type).to eq("application/json; charset=utf-8")
        end
    end

end