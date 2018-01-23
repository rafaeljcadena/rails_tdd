require 'rails_helper'
RSpec::Matchers.define_negated_matcher :be_not_nil, :be_nil

RSpec.describe Customer, type: :model do

	
  it '#Full Name' do
  	customer = create(:customer)
  	customer = create(:user) # Aliases para fábricas
  	expect(customer.full_name).to start_with('Sr. ')
  end

  it '#Full Name com atributo sobrescrito' do
  	customer = create(:customer, name: 'Rafael Cadena')
  	expect(customer.full_name).to start_with('Sr. Rafael Cadena')
  end

  it '#Full Name com atributo sobrescrito - Herança' do
  	customer = create(:customer_vip)
  	expect(customer.vip).to be_truthy
  end

  it 'Usando attributes_for' do
  	attrs = attributes_for(:customer_vip)
  	customer = Customer.create(attrs)
  	expect(customer.created_at).to be_not_nil
  end

  it 'Atributo Transitório' do
  	customer = create(:customer_default, upcased: true)
  	expect(customer.name.upcase).to eq(customer.name)
  end

  it 'Traits - Cliente Masculino VIP' do
  	customer = create(:customer_male_vip)
  	expect(customer.gender).to eq('M')
  	expect(customer.vip).to eq(true)
  end

  it 'Traits - Cliente Feminino VIP' do
  	customer = create(:customer_female_vip)
  	expect(customer.gender).to eq('F')
  	expect(customer.vip).to eq(true)
  end

  it '#travel' do
    puts "Time Current: #{Time.zone.now}"
    travel 1.month do 
      puts "Time Travel: #{Time.zone.now}"
    end
  end

  it '#travel_to' do
    puts "Time Current: #{Time.zone.now}"
    travel_to Time.zone.local(2019, 11, 24, 01, 04, 44) do
      puts "Time Travel: #{Time.zone.now}"
    end
  end

  it 'travel_to with customer' do
    travel_to Time.zone.local(2019, 11, 24, 01, 04, 44) do
      @customer = create(:customer_vip)
    end

    expect(@customer.created_at.year).to eq(2019)
  end

  it {expect{ create(:customer) }.to change{Customer.all.size}.by(1)}


end
