class MyPokemonForm
  include ActiveModel::Model

  attr_accessor :user_id, :name, :ability, :nature, :item,
                :ev_h, :ev_a, :ev_b, :ev_c, :ev_d, :ev_s,
                :iv_h, :iv_a, :iv_b, :iv_c, :iv_d, :iv_s,
                :move_1, :move_2, :move_3, :move_4, :role

  validates :name, presence: true
  validates :ability, presence: true
  validates :nature, presence: true
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
      nature: nature,
      ev_h: ev_h.to_i,
      ev_a: ev_a.to_i,
      ev_b: ev_b.to_i,
      ev_c: ev_c.to_i,
      ev_d: ev_d.to_i,
      ev_s: ev_s.to_i,
      iv_h: iv_h.to_i,
      iv_a: iv_a.to_i,
      iv_b: iv_b.to_i,
      iv_c: iv_c.to_i,
      iv_d: iv_d.to_i,
      iv_s: iv_s.to_i,
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
end
