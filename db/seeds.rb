require "csv"

advicemenus_csv = CSV.readlines("db/advicemenus.csv")
advicemenus_csv.each do |row|
  Advicemenu.create(menu: row[1], minimam_reps: row[2], max_reps: row[3], sets: row[4], group: row[5])
end