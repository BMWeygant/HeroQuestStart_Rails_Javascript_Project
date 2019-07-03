class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :hero_id, :little_sister, :experience_id

  belongs_to :experience
  belongs_to :hero
  belongs_to :user
end
