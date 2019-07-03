class HeroSerializer < ActiveModel::Serializer
  attributes :id, :name, :hp, :treasure, :total_xp, :incapacitated

  has_many :adventures
  has_many :experiences
  belongs_to :user
end
