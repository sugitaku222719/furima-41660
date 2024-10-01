FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name_kanji {"山田"}
    first_name_kanji {"太郎"}
    family_name_katakana {"ヤマダ"}
    first_name_katakana {"タロウ"}
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end