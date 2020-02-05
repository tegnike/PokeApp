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
  "ブロッキング" => "Dark",
  "くらいつく" => "Dark",
  "どげざつき" => "Dark",
  "タールショット" => "Rock",
  "たこがため" => "Fighting",
  "ボディプレス" => "Fighting",
  "スターアサルト" => "Fighting",
  "はいすいのじん" => "Fighting",
  "りんごさん" => "Grass",
  "えだづき" => "Grass",
  "Gのちから" => "Grass",
  "ドラムアタック" => "Grass",
  "トラバサミ" => "Grass",
  "でんげきくちばし" => "Electric",
  "オーラぐるま" => "Electric",
  "オーバードライブ" => "Electric",
  "ダイマックスほう" => "Dragon",
  "ソウルビート" => "Dragon",
  "ムゲンダイビーム" => "Dragon",
  "ドラゴンアロー" => "Dragon",
  "ワイドブレイカー" => "Dragon",
  "おちゃかい" => "Normal",
  "きょじゅうだん" => "Steel",
  "きょじゅうざん" => "Steel",
  "てっていこうせん" => "Steel",
  "デコレーション" => "Fairy",
  "ソウルクラッシュ" => "Fairy",
  "ワンダースチーム" => "Fairy",
  "かえんボール" => "Fire",
  "エラがみ" => "Water",
  "ねらいうち" => "Water"
}

moves_8gen.each do |key, value|
  Move.seed do |s|
    s.move = key
    s.type = value
  end
end
