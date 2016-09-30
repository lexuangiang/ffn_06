class Rank < ApplicationRecord
  belongs_to :club
  belongs_to :session

  has_many :ranks, dependent: :destroy
end
