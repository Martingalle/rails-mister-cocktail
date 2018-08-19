class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true
  validates :name, presence: true

  INGREDIENTS = [ "Sugar", "Lemon", "Mint", "Orange", "Ice" ]
end
