require 'rails_helper'
RSpec.describe Expendable, type: :model do
  before do
    @expendable = FactoryBot.build(:expendable)
  end

  describe '消耗品情報の保存' do
    context '消耗品登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@expendable).to be_valid
      end
    end

    context '消耗品登録が出来ないとき' do
      it "nameが空だと登録できない" do
        @expendable.name = ""
        @expendable.valid?
        expect(@expendable.errors.full_messages).to include "Nameを入力してください"
      end
      it "contentが空だと登録できない" do
        @expendable.content = ""
        @expendable.valid?
        expect(@expendable.errors.full_messages).to include "Contentを入力してください"
      end
      it "periodが空だと登録できない" do
        @expendable.period = ""
        @expendable.valid?
        expect(@expendable.errors.full_messages).to include "Periodを入力してください"
      end
    end
  end
end
