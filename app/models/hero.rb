class Hero < ApplicationRecord
  belongs_to :user
  has_many :experiences
  has_many :adventures, through: :experiences
  scope :incapacitated, -> {where(incapacitated: true) }
end
