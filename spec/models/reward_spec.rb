require 'spec_helper'

describe Reward do
  # let(:business){
  #   # create(:business)
  #   Business.create(name: "Taco King", code: "1111", password: "test")
  # }
  #
  # let(:user){
  #   create :user, name: 'David'
  # }

  it 'can be created' do
    # business.password_hash = 'test'
    reward = create :reward
    expect(reward).to_not be_nil
    # expect(reward.offer).to eq('Free Burrito')
    # expect(reward.visit_count).to be_an(Integer)
    # expect(reward.visit_count).to_not eq(2)
  end

end
