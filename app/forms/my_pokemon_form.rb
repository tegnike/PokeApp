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
  validates :ev_h, presence: true
  validates :ev_a, presence: true
  validates :ev_b, presence: true
  validates :ev_c, presence: true
  validates :ev_d, presence: true
  validates :ev_s, presence: true
  validates :iv_h, numericality: { less_than_or_equal_to: 252 }
  validates :iv_a, numericality: { less_than_or_equal_to: 252 }
  validates :iv_b, numericality: { less_than_or_equal_to: 252 }
  validates :iv_c, numericality: { less_than_or_equal_to: 252 }
  validates :iv_d, numericality: { less_than_or_equal_to: 252 }
  validates :iv_s, numericality: { less_than_or_equal_to: 252 }
  validates :move_1, presence: true
  validates :role, length: { maximum: 20 }

  def save
    ActiveRecord::Base.transaction do
      pokemon_new
      ability_new
      item_new
      moves_new
      @pokemon.save
    end
  end

  def pokemon_new
    @pokemon = MyPokemon.new(
      user: User.find(user_id.to_i),
      pokemon: Pokemon.find_by(name: name),
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
end
