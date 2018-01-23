require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'belongs_to association' do
  	customer = create(:customer_male_vip)
  	order = create(:order, customer: customer)
  	expect(order.customer).to be_kind_of(Customer)
  end

  it 'Gerar 3 pedidos - create_list' do
  	orders = create_list(:order, 3)
  	expect(orders.count).to eq(3)
  end

  it 'has_many association' do
  	# customer = create(:customer, :with_orders, qtd_orders: 2)
  	# expect(customer.orders.count).to eq(2)
  	
  	# customer = create(:customer_with_orders)
  	customer = create(:customer, :with_orders)
  	expect(customer.orders.count).to eq(3)
  end
end
