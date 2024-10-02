FactoryBot.define do
  factory :item do
    name { Faker::Commerce.product_name }
    content { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    area_id { 2 }
    period_id { 2 }
    price { rand(300..9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
