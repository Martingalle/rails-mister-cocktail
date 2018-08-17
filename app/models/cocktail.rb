class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependant: :destroy

  validates :name, uniqueness: true
  validates :name, presence: true
end
