require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'Tem 1 Pedido' do
  	customer = create(:customer_male_vip)
  	order = create(:order, customer: customer)
  	expect(order.customer).to be_kind_of(Customer)
  end
end
