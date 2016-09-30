class News < ApplicationRecord
  belongs_to :category_news
  belongs_to :user
end
