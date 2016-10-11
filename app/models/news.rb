class News < ApplicationRecord
  belongs_to :category_news
  belongs_to :user

  mount_uploader :image, PictureUploader
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  validates :category_news_id, presence: true
  validates :user_id, presence: true
  validate :picture_size

  scope :asc_by_created_at, ->{order created_at: :asc}

  private
  def picture_size
    if image.size > Settings.size_image.megabytes
      errors.add :image, I18n.t("news.error_image")
    end
  end
end
