FactoryBot.define do
  factory :pokemon do
    number { 25 }
    name { "ピカチュウ" }
    type1 { 0 }
    type2 { 1 }
    form { "" }
    bs_h { 80 }
    bs_a { 80 }
    bs_b { 80 }
    bs_c { 80 }
    bs_d { 80 }
    bs_s { 80 }
    form_name { "" }
    full_name { "ピカチュウ" }
  end
end
