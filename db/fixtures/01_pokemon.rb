require "net/http"
require "uri"
require "json"

uri = URI.parse("https://raw.githubusercontent.com/tegnike/pokedex/master/pokemon_list.json")
json = Net::HTTP.get(uri)
results = JSON.parse(json)

def find_type(value)
  case value
  when "ノーマル" then :normal
  when "ほのお" then :fire
  when "みず" then :water
  when "でんき" then :electric
  when "くさ" then :grass
  when "こおり" then :ice
  when "かくとう" then :fighting
  when "どく" then :poison
  when "じめん" then :ground
  when "ひこう" then :flying
  when "エスパー" then :psychic
  when "むし" then :bug
  when "いわ" then :rock
  when "ゴースト" then :ghost
  when "ドラゴン" then :dragon
  when "あく" then :dark
  when "はがね" then :steel
  when "フェアリー" then :fairy
  else
    nil
  end
end

results.each do |result|
  pokemon = Pokemon.find_or_initialize_by(number: result["id"].to_i)
  if pokemon.new_record?
    Pokemon.seed do |s|
      s.id = result["id"]
      s.number = result["number"]
      s.name = result["name"]
      s.type1 = find_type(result["type1"])
      s.type2 = find_type(result["type2"])
      s.form = result["form"].presence
      s.form_name = result["form_name"].presence
      s.full_name =
        result["form_name"].present? ? result["name"] + "（" + result["form_name"] + "）" : result["name"]
      s.bs_h = result["bs_h"]
      s.bs_a = result["bs_a"]
      s.bs_b = result["bs_b"]
      s.bs_c = result["bs_d"]
      s.bs_d = result["bs_d"]
      s.bs_s = result["bs_s"]
    end
  end
end
