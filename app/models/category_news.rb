class CategoryNews < ApplicationRecord
  has_many :news, dependent: :destroy

  validates :category_name, presence: true
end
