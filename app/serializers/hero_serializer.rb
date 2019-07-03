class HeroSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :hp, :treasure, :total_xp, :incapacitated

  has_many :adventures
  has_many :experiences
  belongs_to :user
end
