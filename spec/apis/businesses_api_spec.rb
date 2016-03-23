require 'spec_helper'

def app
  ApplicationApi
end

describe BusinessesApi do
  include Rack::Test::Methods

  describe 'GET /businesses' do
    before do
      params = {
        name: 'Taco King',
        password: 'tacos'
      }
      post :businesses, params
    end
    it 'returns all of the businesses' do
      get "/businesses"
      expect(last_response.body).to_not be_nil
      expect(JSON.parse(last_response.body)).to be_kind_of(Array)
      expect(JSON.parse(last_response.body)[0]['name']).to eq('Taco King')
    end
  end

  describe 'POST /businesses' do
    it 'returns the created business' do
      params = {
        name: 'Taco King',
        password: 'tacos'
      }
      post :businesses, params
      expect(parsed_response.data.name).to eq('Taco King')
      # expect(JSON.parse(last_response.body)[0]['name']).to eq('Taco King')
    end
  end

  describe 'PUT /businesses' do
    let(:business){
      Business.create(name: 'Taco King', password: 'tacos')
    }
    it 'returns the created business' do
      params = {
        name: 'Nacho King',
      }
      put "businesses/#{business.id}", params
      expect(parsed_response.data.name).to eq('Nacho King')
      # expect(JSON.parse(last_response.body)[0]['name']).to eq('Taco King')
    end
  end
end
