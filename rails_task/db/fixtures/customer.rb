#use 'rake db:seed_fu'

Customer.seed(:id) do |s|
  s.id = 1
  s.name = "Dean"
  s.surname = "Martin"
  s.email = "dean.martin@culini.com"
end

Customer.seed(:id) do |s|
  s.id = 2
  s.name = "Buddy"
  s.surname = "Rich"
  s.email = "buddy.rich@culini.com"
end

Customer.seed(:id) do |s|
  s.id = 3
  s.name = "Miles"
  s.surname = "Davis"
  s.email = "miles.davis@culini.com"
end

Customer.seed(:id) do |s|
  s.id = 4
  s.name = "Billie"
  s.surname = "Holiday"
  s.email = "billie.holiday@culini.com"
end
