class Adventure < ApplicationRecord
belongs_to :experience
belongs_to :hero

  def prepare_for_adventure
    if incapacitated
      incapacitated_message
    else
      set_out_on_adventure
    end
  end

  def incapacitated
    self.hero.hp <= 0
  end

  def incapacitated_message
    "This hero is incapacitated and cannot go on adventures."
  end

  def set_out_on_adventure
    self.hero.update(:hp => (@self.hero.hp - self.experience.hp_rating),
                     :treasure => (self.hero.treasure - self.experience.treasure_rating),
                     :total_xp => (self.hero.xp - self.experience.xp_rating)
                    )
                   "Your hero has returned!"
  end
end
