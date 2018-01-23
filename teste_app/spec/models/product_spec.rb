require 'rails_helper'
RSpec.describe Product, type: :model do
  it 'is valid with price, description and category' do
		product = create(:product)
		expect(product).to be_valid
  end

  context 'Validations' do
	  it { is_expected.to validate_presence_of(:price) }

	  # it 'is valid without price' do
			# product = build(:product, price: nil)
			# product.valid?
			# expect(product.errors[:price]).to include("can't be blank")
	  # end

	  it { is_expected.to validate_presence_of(:description) }

	  # it 'is valid without description' do
			# product = build(:product, description: nil)
			# product.valid?
			# expect(product.errors[:description]).to include("can't be blank")
	  # end

	  it { is_expected.to validate_presence_of(:category) }

	  # it 'is valid without category' do
			# product = build(:product, category: nil)
			# product.valid?
			# expect(product.errors[:category]).to include("can't be blank")
	  # end
  end

  context 'Associations' do
	  it { is_expected.to belong_to(:category) }
  end

  context 'Instance Methods' do    
  end
end