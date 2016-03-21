require 'spec_helper'

describe Business do
  let(:business_test){
    create(:business, :mexican_restaurant)
  }

  it 'can be created' do
    # business = create(:business)
    expect(business_test).to_not be_nil
    expect(business_test.name).to eq('Taco King')
  end

  it 'can be updated' do
    business_test.update_columns(name: 'Nacho King')
    expect(business_test.name).to eq('Nacho King')
  end
end
