class AdventureSerializer < ActiveModel::Serializer
  attributes :id, :little_sister

  belongs_to :experience
  belongs_to :hero
  belongs_to :user
end
