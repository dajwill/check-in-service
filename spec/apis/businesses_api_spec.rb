require 'spec_helper'

def app
  ApplicationApi
end

describe BusinessesApi do
  include Rack::Test::Methods

  describe 'GET /businesses' do
    before do
      params = {
        name: 'world',
        password: 'test'
      }
      post :businesses, params
    end
    it 'returns to you all the businesses' do
      get "/businesses"
      # do_request
      # expect(response).to be_success
      # expect(parsed_response.data).to be_kind_of(Array)
      # puts parsed_response.data
      # expect(response.body).to_not be_nil
      expect(last_response.body).to_not be_nil
      expect(JSON.parse(last_response.body)).to be_kind_of(Array)
      expect(JSON.parse(last_response.body)[0]['name']).to eq('world')
      # expect(parsed_response.data).to_not be_nil
      # expect(parsed_response.data.name).to eq("Reza")
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
