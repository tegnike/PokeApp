FactoryBot.define do
  factory :my_pokemon do
    user
    pokemon
    nature { 1 }
    ev_h { 31 }
    ev_a { 31 }
    ev_b { 31 }
    ev_c { 31 }
    ev_d { 31 }
    ev_s { 31 }
    iv_h { 4 }
    iv_a { 252 }
    iv_b { 0 }
    iv_c { 0 }
    iv_d { 0 }
    iv_s { 252 }
    role { "物理AT" }
  end
end
