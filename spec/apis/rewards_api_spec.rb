require 'spec_helper'

def app
  ApplicationApi
end

describe RewardsApi do
  include Rack::Test::Methods

  describe 'POST /rewards' do
    let(:business){
      Business.create(name: 'Taco King', password: 'tacos')
    }
    it "it does't create a reward without password" do
      params = {
        offer: '1/2 off tacos!',
        visit_count: 1,
        business_id: business.id,
      }
      post :rewards, params
      expect(parsed_response.data).to be_nil
    end
  end
end
