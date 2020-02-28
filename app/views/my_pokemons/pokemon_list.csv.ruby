require "csv"
require "net/http"
require "uri"
require "json"

files = ["gen1", "gen2", "gen3", "form_3", "gen4", "form_4",
  "gen5", "form_5", "gen6", "form_6", "gen7", "form_7",
  "gen8", "form_8"]

CSV.generate do |csv|
  column_names = %w(
    number name type1 type2 form form_ja ability1 ability2 ability3
    bs_h bs_a bs_b bs_c bs_d bs_s egg_group1 egg_group2
  )
  csv << column_names

  files.each do |file|
    uri = URI.parse("https://raw.githubusercontent.com/ytakahashi/pokedex.js/master/src/resources/pokemon/#{file}.json")
    json = Net::HTTP.get(uri)
    results = JSON.parse(json)

    results.each do |result|
      column_values = [
        result["id"],
        result["name"],
        result["type"][0],
        result["type"][1],
        result["formId"],
        "",
        result["abilities"][0]["name"],
        result["abilities"][1] ? result["abilities"][1]["name"] : "",
        result["abilities"][2] ? result["abilities"][2]["name"] : "",
        result["status"]["H"],
        result["status"]["A"],
        result["status"]["B"],
        result["status"]["C"],
        result["status"]["D"],
        result["status"]["S"],
        result["egg_groups"][0],
        result["egg_groups"][1]
      ]
      csv << column_values
    end
  end
end
