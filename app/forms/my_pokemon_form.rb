class MyPokemonForm
  include ActiveModel::Model

  attr_accessor :user_id, :name, :ability, :item,
                :status_up, :status_down,
                :ev_h, :ev_a, :ev_b, :ev_c, :ev_d, :ev_s,
                :iv_h, :iv_a, :iv_b, :iv_c, :iv_d, :iv_s,
                :move_1, :move_2, :move_3, :move_4, :role

  validates :name, presence: true
  validates :ability, presence: true
  validates :status_up, presence: true
  validates :status_down, presence: true
  validates :item, presence: true
  validates :iv_h, numericality: { less_than_or_equal_to: 252 }
  validates :iv_a, numericality: { less_than_or_equal_to: 252 }
  validates :iv_b, numericality: { less_than_or_equal_to: 252 }
  validates :iv_c, numericality: { less_than_or_equal_to: 252 }
  validates :iv_d, numericality: { less_than_or_equal_to: 252 }
  validates :iv_s, numericality: { less_than_or_equal_to: 252 }
  validates :move_1, presence: true
  validates :role, length: { maximum: 20 }

  def save
    return false unless valid?
    pokemon_new
    ability_new
    item_new
    moves_new
    @pokemon.save
  end

  def pokemon_new
    pokemon = Pokemon.find_by(full_name: name)
    @pokemon = MyPokemon.new(
      user: User.find(user_id.to_i),
      pokemon: pokemon,
      status_up: get_status(status_up),
      status_down: get_status(status_down),
      iv_h: integer_string?(iv_h),
      iv_a: integer_string?(iv_a),
      iv_b: integer_string?(iv_b),
      iv_c: integer_string?(iv_c),
      iv_d: integer_string?(iv_d),
      iv_s: integer_string?(iv_s),
      ev_h: ev_h.to_i,
      ev_a: ev_a.to_i,
      ev_b: ev_b.to_i,
      ev_c: ev_c.to_i,
      ev_d: ev_d.to_i,
      ev_s: ev_s.to_i,
      av_h: calc_h(pokemon),
      av_a: calc_a(pokemon),
      av_b: calc_b(pokemon),
      av_c: calc_c(pokemon),
      av_d: calc_d(pokemon),
      av_s: calc_s(pokemon),
      role: role
    )
  end

  def ability_new
    @pokemon.build_my_poke_ability(
      ability: Ability.find_by(ability: ability)
    )
  end

  def item_new
    @pokemon.build_my_poke_item(
      item: Item.find_by(item: item)
    )
  end

  def moves_new
    moves = [move_1, move_2, move_3, move_4]
    moves.each do |move|
      if move.present?
        @pokemon.my_poke_moves.build(
          move: Move.find_by(move: move)
        )
      end
    end
  end

  private
    def integer_string?(str)
      Integer(str)
      str.to_i
    rescue ArgumentError
      999
    end

    def get_status(status)
      case status
      when "0"
        "A"
      when "1"
        "B"
      when "2"
        "C"
      when "3"
        "D"
      when "4"
        "S"
      end
    end

    def calc_h(pokemon)
      return "x" if iv_h == "x"
      ((pokemon.bs_h + iv_h.to_i / 2.0 + ev_h.to_i / 8.0) + 60).floor
    end

    def calc_a(pokemon)
      return "x" if iv_a == "x"
      calc_before_status = ((pokemon.bs_a + iv_a.to_i / 2.0 + ev_a.to_i / 8.0) + 5)
      if get_status(status_up) == "A"
        (calc_before_status * 1.1).floor
      elsif get_status(status_down) == "A"
        (calc_before_status * 0.9).floor
      else
        calc_before_status.floor
      end
    end

    def calc_b(pokemon)
      return "x" if iv_b == "x"
      calc_before_status = ((pokemon.bs_b + iv_b.to_i / 2.0 + ev_b.to_i / 8.0) + 5)
      if get_status(status_up) == "B"
        (calc_before_status * 1.1).floor
      elsif get_status(status_down) == "B"
        (calc_before_status * 0.9).floor
      else
        calc_before_status.floor
      end
    end

    def calc_c(pokemon)
      return "x" if iv_c == "x"
      calc_before_status = ((pokemon.bs_c + iv_c.to_i / 2.0 + ev_c.to_i / 8.0) + 5)
      if get_status(status_up) == "C"
        (calc_before_status * 1.1).floor
      elsif get_status(status_down) == "C"
        (calc_before_status * 0.9).floor
      else
        calc_before_status.floor
      end
    end

    def calc_d(pokemon)
      return "x" if iv_d == "x"
      calc_before_status = ((pokemon.bs_d + iv_d.to_i / 2.0 + ev_d.to_i / 8.0) + 5)
      if get_status(status_up) == "D"
        (calc_before_status * 1.1).floor
      elsif get_status(status_down) == "D"
        (calc_before_status * 0.9).floor
      else
        calc_before_status.floor
      end
    end

    def calc_s(pokemon)
      return "x" if iv_s == "x"
      calc_before_status = ((pokemon.bs_s + iv_s.to_i / 2.0 + ev_s.to_i / 8.0) + 5)
      if get_status(status_up) == "S"
        (calc_before_status * 1.1).floor
      elsif get_status(status_down) == "S"
        (calc_before_status * 0.9).floor
      else
        calc_before_status.floor
      end
    end
end
