class Cocktail < ApplicationRecord
  has_one_attached :photo
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :photo, presence: true

  def average
    if self.reviews.length > 0
      sum = 0
      self.reviews.each do |review|
        sum += review.rating
      end
      return sum / self.reviews.length
    else
      return 0
    end
  end
end
