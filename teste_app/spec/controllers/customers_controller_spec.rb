require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

	describe 'as a guest' do
		context '#index' do
			it 'responds successfully' do
				get :index
				expect(response).to be_success
			end

			it 'returns a 200 response' do
				get :index
				expect(response).to have_http_status(200)
			end
		end

		context '#show' do
			it 'returns a 302 response(not authorized)' do
				get :show, params: { id: Customer.first.id }
				expect(response).to have_http_status(302)
			end
		end

	end

	describe 'as Logged Member' do
		
		let!(:member) { create(:member) }
		let!(:customer) { create(:customer) }

		it do
      should route(:get, '/customers/1').to('customers#show', id: 1)
		end

		it 'Content-type' do
			sign_in member
			get :show, format: :json, params: {id: customer.id}
			expect(response.content_type).to eq('application/json')
		end

		it 'Flash Notice' do
			customer_params = attributes_for(:customer)
			sign_in member
			post :create, params: {customer: customer_params}
			# p response
			expect(flash[:notice]).to match(/successfully created/)
			# expect(response).to change(Customer, :count).by(1)
		end

		it 'with valid attributes' do
			customer_params = attributes_for(:customer)
			sign_in member
			
			expect {
				post :create, params: {customer: customer_params}
			}.to change(Customer, :count).by(1)
			# expect(response).to have_http_status(200)
		end

		it 'with invalid attributes' do
			customer_params = attributes_for(:customer, address: nil)
			sign_in member
			
			expect {
				post :create, params: {customer: customer_params}
			}.not_to change(Customer, :count)
			# expect(response).to have_http_status(200)
		end

		context '#show' do
			it 'returns a 200 response' do
				# member = create(:member)
				puts member.inspect
				sign_in member

				# sign_in Proc.new { create(:member) }
				get :show, params: { id: Customer.first.id }
				expect(response).to have_http_status(200)
			end

			it 'render #show template' do
				# member = create(:member)
				sign_in member
				# sign_in Proc.new { create(:member) }.call
				get :show, params: { id: Customer.first.id }
				expect(response).to render_template(:show)
			end
		end
	end

end
