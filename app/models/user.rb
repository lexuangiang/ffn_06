class User < ApplicationRecord
  has_many :bets, dependent: :destroy
  has_many :news, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :user_name,  presence: true, length: {maximum: 50}
  validates :password, presence: true, length: {minimum: 6}

  before_save {self.email = email.downcase}
  has_secure_password

  scope :asc_by_name, ->{order user_name: :asc}
end
