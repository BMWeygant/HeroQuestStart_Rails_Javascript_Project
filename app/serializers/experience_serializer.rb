class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :xp, :hp_rating, :treasure_rating, :title, :healing

  has_many :heros
  has_many :adventures
  belongs_to :user
end
