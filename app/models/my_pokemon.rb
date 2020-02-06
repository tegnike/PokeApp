class MyPokemon < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  validates :nature, presence: true
  validates :ev_h, presence: true, numericality: { less_than_or_equal_to: 31 }
  validates :ev_a, presence: true, numericality: { less_than_or_equal_to: 31 }
  validates :ev_b, presence: true, numericality: { less_than_or_equal_to: 31 }
  validates :ev_c, presence: true, numericality: { less_than_or_equal_to: 31 }
  validates :ev_d, presence: true, numericality: { less_than_or_equal_to: 31 }
  validates :ev_s, presence: true, numericality: { less_than_or_equal_to: 31 }
  validates :iv_h, presence: true, numericality: { less_than_or_equal_to: 252 }
  validates :iv_a, presence: true, numericality: { less_than_or_equal_to: 252 }
  validates :iv_b, presence: true, numericality: { less_than_or_equal_to: 252 }
  validates :iv_c, presence: true, numericality: { less_than_or_equal_to: 252 }
  validates :iv_d, presence: true, numericality: { less_than_or_equal_to: 252 }
  validates :iv_s, presence: true, numericality: { less_than_or_equal_to: 252 }
  validates :role, presence: true, length: { maximum: 20 }

  enum nature: {
    hardy: 0, lonely: 1, brave: 2, adamant: 3, naughty: 4,
    bold: 5, docile: 6, relaxed: 7, impish: 8, lax: 9,
    timid: 10, hasty: 11, serious: 12, jolly: 13, naive: 14,
    modest: 15, mild: 16, quiet: 17, bashful: 18, rash: 19,
    calm: 20, gentle: 21, sassy: 22, careful: 23, quirky: 24
  }, _prefix: true
end
