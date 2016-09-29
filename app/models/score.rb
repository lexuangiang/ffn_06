class Score < ApplicationRecord
  has_many :rate_scores, dependent: :destroy
  has_many :bets, dependent: :destroy
end
