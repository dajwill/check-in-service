require 'spec_helper'

def app
  ApplicationApi
end

describe UsersApi do
  include Rack::Test::Methods

  describe 'GET /users' do
    before do
      params = {
        name: 'David',
      }
      post :users, params
    end
    it 'returns all of the users' do
      get "/users"
      expect(last_response.body).to_not be_nil
      expect(parsed_response.data[0].name).to eq('David')
    end
  end

  describe 'POST /users' do
    it 'returns the created user' do
      params = {
        name: 'Samantha'
      }
      post "/users", params
      expect(parsed_response.data.name).to_not eq('David')
    end
  end

  describe 'PUT /users' do
    let(:user){
      User.create(name: 'David')
    }
    it 'returns the updated user' do
      params = {
        name: 'Nacho King'
      }
      put "users/#{user.id}", params
      expect(parsed_response.data.name).to_not eq('David')
      # expect(JSON.parse(last_response.body)[0]['name']).to eq('Taco King')
    end
  end

end
