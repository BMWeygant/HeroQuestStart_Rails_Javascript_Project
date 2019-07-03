class Experience < ApplicationRecord
  has_many :heros, through: :adventures
  has_many :adventures
  belongs_to :user
  validates_presence_of :title, :message => "You have to have a title. I hope you're satisfied, Z -_-."
end
