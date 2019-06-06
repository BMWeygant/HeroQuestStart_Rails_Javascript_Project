class Adventure < ApplicationRecord
belongs_to :experience
belongs_to :hero
validates_presence_of :title
end
