class Group < ApplicationRecord
  belongs_to :user
  has_many :attendances, dependent: :destroy
  has_many :attendees, through: :attendances, source: :user
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 10}
end
