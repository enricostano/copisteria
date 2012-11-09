# spec/factories/line_items.rb
FactoryGirl.define do
  factory :line_item do
    order 
    tender
    quantity  '1'
    price     '10'
  end
end
