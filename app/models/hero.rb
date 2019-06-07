class Hero < ApplicationRecord
  belongs_to :user
  has_many :adventures
  has_many :experiences, through: :adventures
  validates_presence_of :name, :message => "Hero must have a name. I hope you're satisfied, Z -_-."
  scope :incapacitated, -> {where(incapacitated: true) }

  def incapacitated?
    if self.hp <= 0
      self.incapacitated
    end
  end
end
