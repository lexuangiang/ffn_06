class Rate < ApplicationRecord
  belongs_to :category_match_rate

  has_many :matches, dependent: :destroy
end
