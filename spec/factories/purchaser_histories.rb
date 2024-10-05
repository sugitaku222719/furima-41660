FactoryBot.define do
  factory :purchaser_history do
    token { "tok_abcdefghijk00000000000000000" }
    postal_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    area_id { 2 }
    city { "渋谷区神南" }
    address_line1 { "1-12-16" }
    address_line2 { "アジアビル9階" }
    phone_number { Faker::Number.number(digits: 10) }
    user_id { 1 }
    item_id { 1 }

  end
end
