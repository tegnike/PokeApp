class MyPokemon < ApplicationRecord
  has_one :my_poke_ability, dependent: :destroy
  has_one :ability, through: :my_poke_ability

  has_many :my_poke_moves, dependent: :destroy
  has_many :moves, through: :my_poke_moves

  has_one :my_poke_item, dependent: :destroy
  has_one :item, through: :my_poke_item

  belongs_to :user
  belongs_to :pokemon

  enum iv_h: {
    "31": 31, "x": 999, "0": 0, "30": 30, "29": 29, "28": 28,
    "27": 27, "26": 26, "25": 25, "24": 24, "23": 23, "22": 22,
    "21": 21, "20": 20, "19": 19, "18": 18, "17": 17, "16": 16,
    "15": 15, "14": 14, "13": 13, "12": 12, "11": 11, "10": 10, "9": 9,
    "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2, "1": 1
  }, _prefix: true
  enum iv_a: {
    "31": 31, "x": 999, "0": 0, "30": 30, "29": 29, "28": 28,
    "27": 27, "26": 26, "25": 25, "24": 24, "23": 23, "22": 22,
    "21": 21, "20": 20, "19": 19, "18": 18, "17": 17, "16": 16,
    "15": 15, "14": 14, "13": 13, "12": 12, "11": 11, "10": 10, "9": 9,
    "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2, "1": 1
  }, _prefix: true
  enum iv_b: {
    "31": 31, "x": 999, "0": 0, "30": 30, "29": 29, "28": 28,
    "27": 27, "26": 26, "25": 25, "24": 24, "23": 23, "22": 22,
    "21": 21, "20": 20, "19": 19, "18": 18, "17": 17, "16": 16,
    "15": 15, "14": 14, "13": 13, "12": 12, "11": 11, "10": 10, "9": 9,
    "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2, "1": 1
  }, _prefix: true
  enum iv_c: {
    "31": 31, "x": 999, "0": 0, "30": 30, "29": 29, "28": 28,
    "27": 27, "26": 26, "25": 25, "24": 24, "23": 23, "22": 22,
    "21": 21, "20": 20, "19": 19, "18": 18, "17": 17, "16": 16,
    "15": 15, "14": 14, "13": 13, "12": 12, "11": 11, "10": 10, "9": 9,
    "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2, "1": 1
  }, _prefix: true
  enum iv_d: {
    "31": 31, "x": 999, "0": 0, "30": 30, "29": 29, "28": 28,
    "27": 27, "26": 26, "25": 25, "24": 24, "23": 23, "22": 22,
    "21": 21, "20": 20, "19": 19, "18": 18, "17": 17, "16": 16,
    "15": 15, "14": 14, "13": 13, "12": 12, "11": 11, "10": 10, "9": 9,
    "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2, "1": 1
  }, _prefix: true
  enum iv_s: {
    "31": 31, "x": 999, "0": 0, "30": 30, "29": 29, "28": 28,
    "27": 27, "26": 26, "25": 25, "24": 24, "23": 23, "22": 22,
    "21": 21, "20": 20, "19": 19, "18": 18, "17": 17, "16": 16,
    "15": 15, "14": 14, "13": 13, "12": 12, "11": 11, "10": 10, "9": 9,
    "8": 8, "7": 7, "6": 6, "5": 5, "4": 4, "3": 3, "2": 2, "1": 1
  }, _prefix: true

  enum status_up: {
    "A": 0, "B": 1, "C": 2, "D": 3, "S": 4
  }, _prefix: true
  enum status_down: {
    "A": 0, "B": 1, "C": 2, "D": 3, "S": 4
  }, _prefix: true

  def pokemon_full_name
    pokemon.full_name
  end

  def icon_32
    if pokemon.form
      "//sp.raky.net/pokemon/poke/icon32/n#{pokemon.number.to_s + pokemon.form}.gif"
    else
      "//sp.raky.net/pokemon/poke/icon32/n#{pokemon.number}.gif"
    end
  end

  def ability
    my_poke_ability.ability.ability
  end

  def item
    my_poke_item.item.item
  end

  def moves
    pokemon_moves = []
    my_poke_moves.each do |move|
      pokemon_moves << move.move.move
    end
    pokemon_moves
  end

  def check_ev(ev)
    if ev != 0
      " (#{ev})"
    else
      ""
    end
  end
end
