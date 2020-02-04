FactoryBot.define do
  factory :pokemon do
    number { 151 }
    name { Faker::Games::Pokemon.name }
    type1 { 0 }
    type2 { 1 }
    form { "a" }
    bs_h { 80 }
    bs_a { 80 }
    bs_b { 80 }
    bs_c { 80 }
    bs_d { 80 }
    bs_s { 80 }
  end
end
