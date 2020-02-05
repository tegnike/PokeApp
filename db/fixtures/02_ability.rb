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
    abilities = result["abilities"]
    (0..2).each do |n|
      if abilities[n]
        ability = abilities[n]["name"].delete("*")
        unless Ability.all.map(&:ability).include?(ability)
          Ability.seed do |s|
            s.ability = ability
          end
        end
      end
    end
  end
end
