class Hero < ApplicationRecord
  belongs_to :user
  has_many :adventures
  has_many :experiences, through: :adventures
  validates_presence_of :name
  scope :incapacitated, -> {where(incapacitated: true) }
end
