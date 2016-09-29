class Session < ApplicationRecord
  has_many :ranks, dependent: :destroy
end
