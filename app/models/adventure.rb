class Adventure < ApplicationRecord
belongs_to :experience
belongs_to :hero
belongs_to :user


  def set_out_on_adventure
  #  binding.pry

    self.hero.update(:hp => (self.hero.hp - self.experience.hp_rating),
                         :treasure => (self.hero.treasure + self.experience.treasure_rating),
                         :total_xp => (self.hero.total_xp + self.experience.xp)
                        )
                       "Your hero has returned!"
      end
    end
