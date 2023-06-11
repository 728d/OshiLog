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

  def get_profile_image(width, height)
    profile_image.attached? ? profile_image.variant(resize: "#{width}x#{height}").processed : 'no_image.jpg'
  end
end
