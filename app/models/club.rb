class Club < ApplicationRecord
  has_many :match, dependent: :destroy
end
