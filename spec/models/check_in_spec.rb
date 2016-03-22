require 'spec_helper'

describe CheckIn do
  let(:business){
    Business.create(name: 'test', code: '1111')
  }

  it 'can not be created without business code' do
    # check_in = create :check_in
    expect{create :check_in}.to raise_error
  end

  it 'can be created' do
    check_in = CheckIn.create(user_id: 1, business_id: business.id, business_code: business.code)
    expect(check_in).to_not be_nil
  end

end
