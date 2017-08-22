class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :reverses_of_favorite, class_name: "Favorite",foreign_key: "micropost_id"
  has_many :favoriter,through: :reverses_of_favorite,source: :user
  
  # ファボ
  
  
  def allunfavo
    Favorite.destroy_all(micropost_id: self.id)
  end
  
  
end
