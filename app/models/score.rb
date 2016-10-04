class Score < ApplicationRecord
  has_many :bets, dependent: :destroy
  has_many :rate_scores, dependent: :destroy

  validates :home_score, numericality: {only_integer: true,
    greater_than_or_equal_to: 0}
  validates :away_score, numericality: {only_integer: true,
    greater_than_or_equal_to: 0}
end
