require 'rails_helper'
RSpec.describe Want, type: :model do
  before do
    @want = FactoryBot.build(:want)
  end

  describe 'すぐ必要な物情報の保存' do
    context 'すぐ必要な物の登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@want).to be_valid
      end
      it 'contentが空でも保存できること' do
        @want.content = ""
        @want.valid?
        expect(@want).to be_valid
      end
    end

    context 'すぐ必要な物の登録が出来ないとき' do
      it "nameが空だと登録できない" do
        @want.name = ""
        @want.valid?
        expect(@want.errors.full_messages).to include "Nameを入力してください"
      end
    end
  end
end