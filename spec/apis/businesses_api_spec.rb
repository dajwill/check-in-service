require 'spec_helper'

def app
  ApplicationApi
end

describe BusinessesApi do
  include Rack::Test::Methods

  describe 'GET /businesses' do
    before do
      params = {
        name: "Reza",
        # address: "300 W Ontario St. Chicago, IL",
        # daily_code: "1234",
        password: "password"
      }
      post :businesses, params
    end
    it 'returns to you all the businesses' do
      get "/businesses"
      expect(parsed_response.data).to be_kind_of(Array)
      expect(parsed_response.data[0].name).to eq("Reza")
      # expect(parsed_response.data[0].address).to eq("300 W Ontario St. Chicago, IL")
    end
  end

  # describe 'PUT /business' do
  #   before do
  #     @business = build(:business, :mexican_restaurant)
  #     @business.update_columns(name: 'Nacho King')
  #   end
  #   it 'updates business' do
  #     put '/businesses'
  #     @business.name.should eq('Nacho King')
  #   end
  # end
end
