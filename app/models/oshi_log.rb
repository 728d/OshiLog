class OshiLog < ApplicationRecord
  belongs_to :customer
  has_many :comments,  dependent: :destroy
  has_many :likes,     dependent: :destroy
  has_one_attached :oshi_image
  
  validates :oshi_image, presence: true, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'] }

  def self.looks(range, search, word)
    if range == "Oshi Log"
      if search == "perfect_match"
       OshiLog.where("body LIKE?","#{word}")
      elsif search == "forward_match"
        OshiLog.where("body LIKE?","#{word}%")
      elsif search == "backward_match"
        OshiLog.where("body LIKE?","%#{word}")
      elsif search == "partial_match"
        OshiLog.where("body LIKE?","%#{word}%")
      end
    elsif range == "Oshi"
      if search == "perfect_match"
        OshiLog.where("oshi_name LIKE?","#{word}")
      elsif search == "forward_match"
        OshiLog.where("oshi_name LIKE?","#{word}%")
      elsif search == "backward_match"
        OshiLog.where("oshi_name LIKE?","%#{word}")
      elsif search == "partial_match"
        OshiLog.where("oshi_name LIKE?","%#{word}%")
      end
    elsif range == "Tag"
      if search == "perfect_match"
        OshiLog.where("tag LIKE?","#{word}")
      elsif search == "forward_match"
        OshiLog.where("tag LIKE?","#{word}%")
      elsif search == "backward_match"
       OshiLog.where("tag LIKE?","%#{word}")
      elsif search == "partial_match"
        OshiLog.where("tag LIKE?","%#{word}%")
      end
    end
  end
end

# # 今回は共通していた@oshi_logを消しました
# # Viewページのrangeと合わせたのでカラム名も省略しました
#   def self.looks(range, search, word)
#     if search == "perfect_match"
#         OshiLog.where("#{range} LIKE?","#{word}")
#     elsif search == "forward_match"
#         OshiLog.where("#{range} LIKE?","#{word}%")
#     elsif search == "backward_match"
#         OshiLog.where("#{range} LIKE?","%#{word}")
#     elsif search == "partial_match"
#         OshiLog.where("#{range} LIKE?","%#{word}%")
#     end
#   end
# end
