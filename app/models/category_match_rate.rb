class CategoryMatchRate < ApplicationRecord
  has_many :rates, dependent: :destroy
end
