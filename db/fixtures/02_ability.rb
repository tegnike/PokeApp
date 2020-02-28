require "net/http"
require "uri"
require "json"

uri = URI.parse("https://raw.githubusercontent.com/tegnike/pokedex/master/pokemon_list.json")
json = Net::HTTP.get(uri)
results = JSON.parse(json)

results.each do |result|
  (0..2).each do |n|
    if result["ability#{n}"].present?
      ability = result["ability#{n}"].delete("*")
      unless Ability.all.map(&:ability).include?(ability)
        Ability.seed do |s|
          s.ability = ability
        end
      end
    end
  end
end
