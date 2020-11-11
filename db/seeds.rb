require "csv"

# advicemenus_csv = CSV.readlines("db/advicemenus.csv")
# advicemenus_csv.each do |row|
#   Advicemenu.create(menu: row[1], minimam_reps: row[2], max_reps: row[3], sets: row[4], group: row[5], created_at: row[6], updated_at: row[7])
# end

fooddates_csv = CSV.readlines("db/fooddates.csv")
fooddates_csv.each do |row|
  Fooddate.create(foodname: row[1], gram: row[2], kcal: row[3], protein: row[4], fat: row[5], carbo: row[6])
end