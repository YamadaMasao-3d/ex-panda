class Want < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  validates :name, presence: true, length: { maximum: 40 }
  validates :content, length: { maximum: 100 }
end
