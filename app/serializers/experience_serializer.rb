class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :xp, :hp_rating, :treasure_rating, :user_id, :title, :healing

  has_many :heros
  has_many :adventures
end
