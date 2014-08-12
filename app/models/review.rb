class Review < ActiveRecord::Base
  belongs_to :restaurant

  VALID_RATINGS = (1..5)
  validates :rating, presence: true, inclusion: VALID_RATINGS
end