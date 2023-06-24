class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :oshi_logs, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :expenses,  dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_many :likes,     dependent: :destroy

  has_one_attached :profile_image
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64#ランダムに文字列を入れ替える
      user.name = "ゲスト"
    end
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @customer = Customer.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @customer = Customer.where("name LIKE?","%#{word}%")
    else
      @customer = Customer.all
    end
  end

  def get_profile_image(width, height)
    profile_image.attached? ? profile_image.variant(resize: "#{width}x#{height}").processed : 'no_image.jpg'
  end
end
