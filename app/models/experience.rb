class Experience < ApplicationRecord
  has_many :heros, through: :adventures
  has_many :adventures
  validates_presence_of :title
end
