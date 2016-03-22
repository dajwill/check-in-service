require 'spec_helper'

describe User do
  let(:user){
    User.create(name: "David")
  }

  it 'can be created' do
    expect(user).to_not be_nil
    expect(user.name).to_not eq('Sam')
  end

  it 'can be updated' do
    user.update_columns(name: 'Sam')
    expect(user.name).to eq('Sam')
  end

end
