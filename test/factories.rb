FactoryGirl.define do
  sequence(:email) { |n| "user#{n}@puppa.pup" }
  sequence(:partitaiva) { 11.times.map { (0..9).to_a.sample }.join }

  factory :role do
    name  'user'
  end

  factory :user do
    email
    password        'secret'
    phone           '0999711333'
    address         'via plutarco, 37'
    city            'Barcelona'
    ragionesociale  'Stano s.a.s. di Stano Rita & C.'
    partitaiva
    cap             '12345'
  end

  factory :institution do
    name  'Comune di Manduria'
  end

  factory :project do
    name        'Project1'
    institution
    start       
    stop        
    price       '10'
  end
end
