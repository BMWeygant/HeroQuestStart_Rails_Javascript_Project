class UserSerializer < ActiveModel::Serializer
  attributes :id

   has_many :adventures
   has_many :experiences
   has_many :heros
end
