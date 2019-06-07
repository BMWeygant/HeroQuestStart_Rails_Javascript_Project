class Adventure < ApplicationRecord
belongs_to :experience
belongs_to :hero
belongs_to :user


  def set_out_on_adventure
  #  binding.pry
    if self.little_sister == false
      self.hero.update(:hp => (self.hero.hp - self.experience.hp_rating),
                         :treasure => (self.hero.treasure + self.experience.treasure_rating),
                         :total_xp => (self.hero.total_xp + self.experience.xp)
                        )
    else
      self.hero.update(:hp => (self.hero.hp - self.experience.hp_rating + 2),
                         :treasure => (self.hero.treasure + self.experience.treasure_rating),
                         :total_xp => (self.hero.total_xp + self.experience.xp + 5)
                        )
    end
  end
end
