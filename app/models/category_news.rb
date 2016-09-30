class CategoryNews < ApplicationRecord
  has_many :news, dependent: :destroy
end
