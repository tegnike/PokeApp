FactoryBot.define do
  factory :my_pokemon do
    user
    pokemon
    nature { 1 }
    iv_h { 31 }
    iv_a { 31 }
    iv_b { 31 }
    iv_c { 31 }
    iv_d { 31 }
    iv_s { 31 }
    ev_h { 4 }
    ev_a { 252 }
    ev_b { 0 }
    ev_c { 0 }
    ev_d { 0 }
    ev_s { 252 }
    role { "物理AT" }
  end
end
