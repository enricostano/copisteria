# spec/factories/orders.rb
FactoryGirl.define do
  factory :order do
    user
    authorized  false
  end
end
