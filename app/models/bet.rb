class Bet < ApplicationRecord
  belongs_to :score
  belongs_to :match
  belongs_to :user
end
