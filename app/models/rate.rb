class Rate < ApplicationRecord
  belongs_to :category_match_rate

  validates :home_rate, presence: true, numericality: {greater_than: 0}
  validates :away_rate, presence: true, numericality: {greater_than: 0}
  validates :category_match_rate_id, presence: true
end
