class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :family_name_kanji, presence: true
  validates :first_name_kanji, presence: true
  validates :family_name_katakana, presence: true
  validates :first_name_katakana, presence: true
  validates :birthday, presence: true
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name_kanji
    validates :family_name_kanji
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'カタカナを使用してください' } do
    validates :first_name_katakana
    validates :family_name_katakana
  end
  with_options presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '英数字混合にしてください' } do
    validates :password
  end


  # has_many :items
  # has_many :histories
end
