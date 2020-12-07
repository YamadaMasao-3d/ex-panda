class Expendable < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :content, length: { maximum: 100 }
    validates :period, length: { maximum: 40 }
  end
end
