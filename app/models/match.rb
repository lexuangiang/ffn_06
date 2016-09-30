class Match < ApplicationRecord
  belongs_to :rate
  belongs_to :club

  has_many :bets, dependent: :destroy
end
