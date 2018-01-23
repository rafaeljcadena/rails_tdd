FactoryBot.define do
  factory :member do
		email { Faker::Internet.email }
		password { 'lklklklk' }
  end
end
