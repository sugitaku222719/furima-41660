require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it "全ての欄が埋まっていれば登録できる" do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it "family_name_kanjiが空では登録できない" do
        @user.family_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kanji can't be blank"
      end
      it "first_name_kanjiが空では登録できない" do
        @user.first_name_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanji can't be blank"
      end
      it "family_name_katakanaが空では登録できない" do
        @user.family_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name katakana can't be blank"
      end
      it "first_name_katakanaが空では登録できない" do
        @user.first_name_katakana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "First name katakana can't be blank"
      end
      it "family_name_kanjiが英語では登録できない" do
        @user.family_name_kanji = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kanji 全角文字を使用してください"
      end
      it "first_name_kanjiが英語では登録できない" do
        @user.first_name_kanji = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kanji 全角文字を使用してください"
      end
      it "family_name_katakanaが漢字では登録できない" do
        @user.family_name_katakana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name katakana カタカナを使用してください"
      end
      it "first_name_katakanaが漢字では登録できない" do
        @user.first_name_katakana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include "First name katakana カタカナを使用してください"
      end
      it "birthdayが空では登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = Faker::Internet.password(min_length: 2, max_length: 5)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too long (maximum is 128 characters)"
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = Faker::Internet.password(min_length: 6)
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        user_b = FactoryBot.build(:user)
        user_b.email = @user.email
        user_b.valid?
        expect(user_b.errors.full_messages).to include "Email has already been taken"
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
    end
  end
end

