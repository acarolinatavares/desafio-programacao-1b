require 'rails_helper'

RSpec.describe Sale, type: :model do

  it 'is valid with valid attributes' do
    sale = FactoryGirl.build(:sale)
    expect(sale).to be_valid
  end

  it 'is not valid without a buyer' do
    sale = FactoryGirl.build(:sale, buyer: nil)
    expect(sale).to_not be_valid
  end
  it 'is not valid without a price' do
    sale = FactoryGirl.build(:sale, price: nil)
    expect(sale).to_not be_valid
  end
  it 'is not valid without a quantity' do
    sale = FactoryGirl.build(:sale, quantity: nil)
    expect(sale).to_not be_valid
  end
end