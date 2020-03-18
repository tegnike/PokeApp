require "net/http"
require "uri"
require "json"

uri = URI.parse("https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/moves.json")
json = Net::HTTP.get(uri)
results = JSON.parse(json)

def find_type(value)
  case value
  when "Normal" then :normal
  when "Fire" then :fire
  when "Water" then :water
  when "Electric" then :electric
  when "Grass" then :grass
  when "Ice" then :ice
  when "Fighting" then :fighting
  when "Poison" then :poison
  when "Grand" then :ground
  when "Flying" then :flying
  when "Psychic" then :psychic
  when "Bug" then :bug
  when "Rock" then :rock
  when "Ghost" then :ghost
  when "Dragon" then :dragon
  when "Dark" then :dark
  when "Steel" then :steel
  when "Fairy" then :fairy
  else
    nil
  end
end

results.each do |result|
  Move.seed do |s|
    s.move = result["jname"]
    s.type = find_type(result["type"])
  end
end

moves_8gen = {
  "ブロッキング" => "dark",
  "くらいつく" => "dark",
  "どげざつき" => "dark",
  "タールショット" => "rock",
  "たこがため" => "fighting",
  "ボディプレス" => "fighting",
  "スターアサルト" => "fighting",
  "はいすいのじん" => "fighting",
  "りんごさん" => "grass",
  "えだづき" => "grass",
  "Gのちから" => "grass",
  "ドラムアタック" => "grass",
  "トラバサミ" => "grass",
  "でんげきくちばし" => "electric",
  "オーラぐるま" => "electric",
  "オーバードライブ" => "electric",
  "ダイマックスほう" => "dragon",
  "ソウルビート" => "dragon",
  "ムゲンダイビーム" => "dragon",
  "ドラゴンアロー" => "dragon",
  "ワイドブレイカー" => "dragon",
  "おちゃかい" => "normal",
  "きょじゅうだん" => "steel",
  "きょじゅうざん" => "steel",
  "てっていこうせん" => "steel",
  "デコレーション" => "fairy",
  "ソウルクラッシュ" => "fairy",
  "ワンダースチーム" => "fairy",
  "かえんボール" => "fire",
  "エラがみ" => "water",
  "ねらいうち" => "water"
}

moves_8gen.each do |key, value|
  Move.seed do |s|
    s.move = key
    s.type = value
  end
end
