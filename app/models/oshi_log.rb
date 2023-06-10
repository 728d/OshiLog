class OshiLog < ApplicationRecord
  belongs_to :customer
  
  has_one_attached :oshi_image
end
