class Adventure < ApplicationRecord
belongs_to :experience
belongs_to :hero
belongs_to :user


  def set_out_on_adventure
    clean_code
    if hero.incapacitated == true
        hero.update(:hp => (hero.hp*0),
                    :treasure => (hero.treasure*1),
                    :total_xp => (hero.total_xp*1)
                  )
    elsif little_sister == false
      healing
      hero.update(:hp => (hero.hp - experience.hp_rating),
                         :treasure => (hero.treasure + experience.treasure_rating),
                         :total_xp => (hero.total_xp + experience.xp)
                        )
                        incapacitated
    else
      healing
      hero.update(:hp => (hero.hp - experience.hp_rating + - rand(1..15)),
                         :treasure => (hero.treasure + experience.treasure_rating + rand(1..20) - 10),
                         :total_xp => (hero.total_xp + experience.xp + 5 * rand(0..3))
                        )
                        incapacitated
    end
  end

  def incapacitated
    clean_code
    if hero.hp <= 0
        hero.update(:hp => (hero.hp*0),
                    :incapacitated => true)
    else
      hero.update(:incapacitated => false)
    end
  end

  def healing
    clean_code
    if experience.healing == false
      nil
    elsif experience.healing == true && hero.treasure >= 20
      experience.update(:treasure_rating => (experience.treasure_rating*0),
                        :xp => (experience.xp*0))
      hero.update(:hp => (hero.hp + 10),
                              :treasure => (hero.treasure - 20)
                            )
    else
      experience.update(:hp_rating => (experience.hp_rating*0),
                        :treasure_rating => (experience.treasure_rating*0),
                        :xp => (experience.xp*0)
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
