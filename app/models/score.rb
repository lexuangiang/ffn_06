class Score < ApplicationRecord
  has_many :bets, dependent: :destroy
  has_many :rate_scores, dependent: :destroy
end
