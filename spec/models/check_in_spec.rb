require 'spec_helper'

describe CheckIn do

  it 'can not be created without code' do
    # check_in = create :check_in
    expect{create :check_in}.to raise_error
  end

  it 'needs tests to be written!' do
    pending('write tests for CheckIn!')
  end

end
