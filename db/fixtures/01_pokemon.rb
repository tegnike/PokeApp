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
    pokemon = Pokemon.find_or_initialize_by(number: result["id"].to_i, form: result["formId"])
    if pokemon.new_record?
      Pokemon.seed do |s|
        s.number = result["id"]
        s.name = result["name"]
        s.type1 = find_type(result["type"][0])
        s.type2 = find_type(result["type"][1])
        s.form = result["formId"]
        s.bs_h = result["status"]["H"]
        s.bs_a = result["status"]["A"]
        s.bs_b = result["status"]["B"]
        s.bs_c = result["status"]["C"]
        s.bs_d = result["status"]["D"]
        s.bs_s = result["status"]["S"]
      end
    end
  end
end
