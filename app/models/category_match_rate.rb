class CategoryMatchRate < ApplicationRecord
  has_many :rates, dependent: :destroy

  validates :category_rates, presence: true

end
