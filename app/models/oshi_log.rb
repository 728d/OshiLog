class OshiLog < ApplicationRecord
  belongs_to :customer
  has_many :comments,  dependent: :destroy
  has_many :likes,     dependent: :destroy
  has_one_attached :oshi_image
end
