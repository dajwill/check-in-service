require 'spec_helper'

describe CheckIn do

  it 'can not be created without code' do
    check_in = create :check_in
    expect(check_in).to be_nil
  end

  it 'needs tests to be written!' do
    pending('write tests for CheckIn!')
  end

end
