require 'spec_helper'

def app
  ApplicationApi
end

describe CheckInsApi do
  include Rack::Test::Methods

  describe 'GET /users' do
    let(:business){
      Business.create(name: 'Taco King', password: 'tacos', code: '1111')
    }

    let(:user){
      User.create(name: 'David')
    }

    before do
      params = {
        user_id: user.id,
        business_id: business.id,
        business_code: business.code
      }
      post :users, params
    end
    it 'returns all of the users' do
      get "/visits"
      expect(last_response.body).to_not be_nil
      expect(parsed_response.data).to be_kind_of(Array)
    end
  end

  describe 'POST /visits' do
    let(:business){
      Business.create(name: 'Taco King', password: 'tacos', code: '1111')
    }

    let(:user){
      User.create(name: 'David')
    }

    it 'returns the created check in' do
      params = {
        user_id: user.id,
        business_id: business.id,
        business_code: business.code
      }
      post :visits, params
      expect(parsed_response.data).to_not be_nil
    end
  end
end
