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

  def calc_h
    return "x" if iv_h == "x"
    ((pokemon.bs_h + iv_h.to_i / 2.0 + ev_h / 8.0) + 60).floor
  end

  def calc_a
    return "x" if iv_a == "x"
    calc_before_status = ((pokemon.bs_a + iv_a.to_i / 2.0 + ev_a / 8.0) + 5)
    if status_up == "A"
      (calc_before_status * 1.1).floor
    elsif status_down == "A"
      (calc_before_status * 0.9).floor
    else
      calc_before_status.floor
    end
  end

  def calc_b
    return "x" if iv_b == "x"
    calc_before_status = ((pokemon.bs_b + iv_b.to_i / 2.0 + ev_b / 8.0) + 5)
    if status_up == "B"
      (calc_before_status * 1.1).floor
    elsif status_down == "B"
      (calc_before_status * 0.9).floor
    else
      calc_before_status.floor
    end
  end

  def calc_c
    return "x" if iv_c == "x"
    calc_before_status = ((pokemon.bs_c + iv_c.to_i / 2.0 + ev_c / 8.0) + 5)
    if status_up == "C"
      (calc_before_status * 1.1).floor
    elsif status_down == "C"
      (calc_before_status * 0.9).floor
    else
      calc_before_status.floor
    end
  end

  def calc_d
    return "x" if iv_d == "x"
    calc_before_status = ((pokemon.bs_d + iv_d.to_i / 2.0 + ev_d / 8.0) + 5)
    if status_up == "D"
      (calc_before_status * 1.1).floor
    elsif status_down == "D"
      (calc_before_status * 0.9).floor
    else
      calc_before_status.floor
    end
  end

  def calc_s
    return "x" if iv_s == "x"
    calc_before_status = ((pokemon.bs_s + iv_s.to_i / 2.0 + ev_s / 8.0) + 5)
    if status_up == "S"
      (calc_before_status * 1.1).floor
    elsif status_down == "S"
      (calc_before_status * 0.9).floor
    else
      calc_before_status.floor
    end
  end

  def check_ev(ev)
    if ev != 0
      " (#{ev})"
    else
      ""
    end
  end
end
