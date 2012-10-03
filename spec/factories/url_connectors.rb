# spec/factories/url_connector.rb
FactoryGirl.define do
  factory :url_connector do
    user
    temp_url  'Temporary/Url'
    line_item
    active    false
  end
end
