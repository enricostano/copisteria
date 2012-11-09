# spec/factories/orders.rb
FactoryGirl.define do
  factory :order do
    association :user, :confirmed
    authorized  false
  end
end
