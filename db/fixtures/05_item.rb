require "csv"

CSV.foreach("db/fixtures/items.csv", headers: false, encoding: "Shift_JIS:UTF-8") do |row|
  Item.seed do |s|
    s.item = row[0]
  end
end
