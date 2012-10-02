# spec/factories/line_items.rb
FactoryGirl.define do
  factory :line_item do
    order 
    project
    quantity  '1'
    price     '10'
  end
end
