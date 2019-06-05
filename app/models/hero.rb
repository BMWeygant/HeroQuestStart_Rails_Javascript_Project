class Hero < ApplicationRecord
  belongs_to :user
  has_many :adventures
  has_many :experiences, through: :adventures
  scope :incapacitated, -> {where(incapacitated: true) }
end
