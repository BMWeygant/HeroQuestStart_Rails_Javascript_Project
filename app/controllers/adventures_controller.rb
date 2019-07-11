class AdventuresController < ApplicationController
before_action :authenticate_user!
  def create
    @adventure = Adventure.create(adventure_params)
    @adventure.user_id = current_user.id

    if @adventure
      @adventure.set_out_on_adventure
      if @adventure.hero.incapacitated == true && @adventure.experience.healing == false
        flash[:word] = "#{@adventure.hero.name} is incapacitated and can not go on adventures at this time."
      elsif @adventure.experience.hp_rating == 0
        flash[:word] = "#{@adventure.hero.name} can not afford healing. Do more quests to collect more treasure!"
      else
        flash[:word] = "Your hero has returned!"
      end
      redirect_to hero_path(@adventure.hero)
    else
      redirect_to experience_path
    end
  end

  def adventure_params
    params.require(:adventure).permit(:user_id, :hero_id, :little_sister, :experience_id)
  end

end
