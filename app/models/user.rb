class User < ApplicationRecord
  has_many :bets, dependent: :destroy
  has_many :news, dependent: :destroy
end
