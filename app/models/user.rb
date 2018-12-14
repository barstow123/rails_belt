class User < ApplicationRecord
  has_secure_password
  has_many :groups, dependent: :destroy
  has_many :attendances, dependent: :destroy
  has_many :groups_attending, through: :attendances, source: :group
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
