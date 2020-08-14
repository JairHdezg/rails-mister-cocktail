class Review < ApplicationRecord
  belongs_to :cocktail

  validates :rating, presence: true, numericality: true, acceptance: { accept: [0, 1, 2, 3, 4, 5] }
end
