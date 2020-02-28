require "net/http"
require "uri"
require "json"

uri = URI.parse("https://raw.githubusercontent.com/tegnike/pokedex/master/pokemon_list.json")
json = Net::HTTP.get(uri)
results = JSON.parse(json)

results.each do |result|
  (0..2).each do |n|
    if result["ability#{n}"].present?
      pokemon = Pokemon.find(result["id"])
      ability = Ability.find_by(ability: result["ability#{n}"].delete("*"))
      unless PokeAbility.find_by(pokemon: pokemon, ability: ability)
        PokeAbility.seed do |s|
          s.pokemon = pokemon
          s.ability = ability
        end
      end
    end
  end
end
