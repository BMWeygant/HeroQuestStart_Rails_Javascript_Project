class Experience < ApplicationRecord
  has_many :heros, through: :adventures
  has_many :adventures
end
