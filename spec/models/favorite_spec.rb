require 'rails_helper'
RSpec.describe Favorite, type: :model do
  before do
    @favorite = FactoryBot.build(:favorite)
  end

  describe 'お気に入り品情報の保存' do
    context 'お気に入り品登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@favorite).to be_valid
      end
    end

    context 'お気に入り品登録が出来ないとき' do
      it 'nameが空だと登録できない' do
        @favorite.name = ''
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include 'Nameを入力してください'
      end
      it 'contentが空だと登録できない' do
        @favorite.content = ''
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include 'Contentを入力してください'
      end
      it 'periodが空だと登録できない' do
        @favorite.period = ''
        @favorite.valid?
        expect(@favorite.errors.full_messages).to include 'Periodを入力してください'
      end
    end
  end
end
