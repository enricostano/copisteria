# spec/factories/projects.rb
FactoryGirl.define do
  factory :project do
    name    'Diga sul fiume Borraco'
    start   '01-01-2012'
    stop    '10-01-2012'
    institution
    price   10
  end
end
