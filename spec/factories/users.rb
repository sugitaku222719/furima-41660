FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.email}
    password do
      random_password = Faker::Internet.password(min_length: 4) # 4文字のランダムな文字列を生成
      alphabet = ('a'..'z').to_a.sample  # ランダムな英字1文字
      number = ('0'..'9').to_a.sample     # ランダムな数字1文字
      (random_password + alphabet + number).chars.shuffle.join # シャッフルして英数字混合のパスワードを生成
    end
    password_confirmation {password}
    family_name_kanji {"山田"}
    first_name_kanji {"太郎"}
    family_name_katakana {"ヤマダ"}
    first_name_katakana {"タロウ"}
    birthday { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end