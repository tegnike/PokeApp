require "net/http"
require "uri"
require "json"

files = ["gen1", "gen2", "gen3", "form_3", "gen4", "form_4",
  "gen5", "form_5", "gen6", "form_6", "gen7", "form_7",
  "gen8", "form_8"]

files.each do |file|
  uri = URI.parse("https://raw.githubusercontent.com/ytakahashi/pokedex.js/master/src/resources/pokemon/#{file}.json")
  json = Net::HTTP.get(uri)
  results = JSON.parse(json)

  results.each do |result|
    (0..2).each do |n|
      if result["abilities"][n]
        pokemon = Pokemon.find_by(number: result["id"].to_i, form: result["formId"])
        ability = Ability.find_by(ability: result["abilities"][n]["name"].delete("*"))
        unless PokeAbility.find_by(pokemon: pokemon, ability: ability)
          PokeAbility.seed do |s|
            s.pokemon = pokemon
            s.ability = ability
          end
        end
      end
    end
  end
end
