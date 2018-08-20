class Review < ApplicationRecord
  belongs_to :cocktail

  validates :description, presence: :true
  validates :rating, inclusion: { in: [0,1,2,3,4,5], allow_nil: false }
end
