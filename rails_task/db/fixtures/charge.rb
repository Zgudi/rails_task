#use 'rake db:seed_fu'

#10 successful charges
5.times do |i|
  Charge.seed(:id) do |s|
    s.id = i+1
    s.currency = "USD"
    s.amount = 100,54
    s.paid = true
    s.refunded = false
    s.customer_id = 1
  end
end

3.times do |i|
  Charge.seed(:id) do |s|
    s.id = i+6
    s.currency = "USD"
    s.amount = 500,94
    s.paid = true
    s.refunded = false
    s.customer_id = 2
  end
end

Charge.seed(:id) do |s|
  s.id = 9
  s.currency = "USD"
  s.amount = 250
  s.paid = true
  s.refunded = false
  s.customer_id = 3
end

Charge.seed(:id) do |s|
  s.id = 10
  s.currency = "USD"
  s.amount = 4800,99
  s.paid = true
  s.refunded = false
  s.customer_id = 4
end

#5 failed charges
3.times do |i|
  Charge.seed(:id) do |s|
    s.id = i+11
    s.currency = "USD"
    s.amount = 4900,89
    s.paid = false
    s.refunded = false
    s.customer_id = 3
  end
end

2.times do |i|
  Charge.seed(:id) do |s|
    s.id = i+14
    s.currency = "USD"
    s.amount = 350,10
    s.paid = false
    s.refunded = false
    s.customer_id = 4
  end
end


#5 disputed charges
3.times do |i|
  Charge.seed(:id) do |s|
    s.id = i+16
    s.currency = "USD"
    s.amount = 775
    s.paid = true
    s.refunded = true
    s.customer_id = 1
  end
end

2.times do |i|
  Charge.seed(:id) do |s|
    s.id = i+19
    s.currency = "USD"
    s.amount = 850
    s.paid = true
    s.refunded = true
    s.customer_id = 2
  end
end