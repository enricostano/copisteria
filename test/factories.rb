FactoryGirl.define do
  factory :role do
    role  'user'
  end

  factory :user do
    email           'puppy@puppa.pup'
    password        'secret'
    phone           '0999711333'
    address         'via plutarco, 37'
    city            'Barcelona'
    ragionesociale  'Stano s.a.s. di Stano Rita & C.'
    partitaiva      '12345678901'
    cap             '12345'
  end
end
