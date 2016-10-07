class Player < ApplicationRecord
  belongs_to :club

  mount_uploader :image, PictureUploader
  validates :player_name, presence: true
  validates :nationality, presence: true
  validates :position, presence: true
  validates :height, presence: true, numericality: {greater_than: 0}
  validates :weight, presence: true, numericality: {greater_than: 0}
  validates :club_id, presence: true
  validate :picture_size

  scope :asc_by_name, ->{order player_name: :asc}

  private
  def picture_size
    if image.size > Settings.size_image.megabytes
      errors.add :image, I18n.t("player.error_image")
    end
  end
end
