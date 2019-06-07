class Adventure < ApplicationRecord
belongs_to :experience
belongs_to :hero
belongs_to :user


  def set_out_on_adventure
  #  binding.pry
  clean_code
    if little_sister == false
      hero.update(:hp => (hero.hp - experience.hp_rating),
                         :treasure => (hero.treasure + experience.treasure_rating),
                         :total_xp => (hero.total_xp + experience.xp)
                        )
    else
      hero.update(:hp => (hero.hp - experience.hp_rating + 2),
                         :treasure => (hero.treasure + experience.treasure_rating),
                         :total_xp => (hero.total_xp + experience.xp + 5)
                        )
    end
  end

  private
  
  def clean_code
    hero = self.hero
    experience = self.experience
    little_sister = self.little_sister
  end
end
