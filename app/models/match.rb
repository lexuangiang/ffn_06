class Match < ApplicationRecord
  belongs_to :rate

  has_many :bets, dependent: :destroy
end
