  class CategoryMatchRate < ApplicationRecord
  has_many :rates, deopendent: :destroy
end
