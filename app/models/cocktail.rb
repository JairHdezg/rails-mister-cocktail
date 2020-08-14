class Cocktail < ApplicationRecord
  has_one_attached :photo
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  def average
    sum = 0
    self.reviews.each do |review|
      sum += review.rating
    end
    sum / self.reviews.length
  end
end
