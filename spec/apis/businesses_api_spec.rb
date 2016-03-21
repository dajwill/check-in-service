require 'spec_helper'

def app
  ApplicationApi
end

describe BusinessesApi do
  include Rack::Test::Methods

  # describe 'GET /businesses' do
  #   before do
  #     params = {
  #       name: 'Taco King',
  #       type: 'Restaurant',
  #       code: 1111
  #     }
  #   end
  #   post :businesses, params
  # end
  # it 'returns a list of businesses' do
  #   get "/businesses"
  #   expect(parsed_response.data).to be_kind_of(Array)
  # end

  describe 'GET /businesses' do
    before do
      @business = create(:business, :mexican_restaurant)
    end
    it 'list all of the businesses' do
      get "/businesses"
      expect(@business).to be_kind_of(Array)
      expect(parsed_response.data.first['name']).to eq('Taco King')
    end
  end

  describe 'PUT /business' do
    before do
      @business = build(:business, :mexican_restaurant)
      @business.update_columns(name: 'Nacho King')
    end
    it 'updates business' do
      put '/businesses'
      @business.name.should eq('Nacho King')
    end
  end
end
