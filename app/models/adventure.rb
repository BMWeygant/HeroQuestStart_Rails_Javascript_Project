class Adventure < ApplicationRecord
has_many :experiences
has_many :heros, through: :experiences
end
