class Club < ApplicationRecord
  has_many :players, dependent: :destroy
  has_many :home, :class_name => "Match", :foreign_key => "home_id"
  has_many :away, :class_name => "Match", :foreign_key => "away_id"

  mount_uploader :image, PictureUploader
  validates :club_name, presence: true
  validates :stadium, presence: true
  validates :coach, presence: true
  validate  :picture_size

  scope :asc_by_name, ->{order club_name: :asc}

  private
  def picture_size
    if image.size > Settings.size_image.megabytes
      errors.add :image, I18n.t("club.error_image")
    end
  end
end
