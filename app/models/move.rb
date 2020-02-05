class Move < ApplicationRecord
  validates :move, presence: true
  validates :type, presence: true
end
