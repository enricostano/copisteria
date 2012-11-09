# spec/factories/users.rb
FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@puppa.pup" }
  sequence(:partitaiva) { 11.times.map { (0..9).to_a.sample }.join }
  
  factory :user do
    email
    password              'secret'
    password_confirmation 'secret'
    phone                 '0999711333'
    address               'via plutarco, 37'
    city                  'Barcelona'
    ragionesociale        'Stano s.a.s. di Stano Rita & C.'
    partitaiva
    cap                   '12345'

    trait :confirmed do
      before(:create) { |user| user.skip_confirmation! }
    end
  end
end
