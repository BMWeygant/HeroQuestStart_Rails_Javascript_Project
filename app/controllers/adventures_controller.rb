class AdventuresController < ApplicationController
before_action :authenticate_user!
  def create
    @adventure = Adventure.create(adventure_params)
    @adventure.user_id = current_user.id
    #binding.pry

    if @adventure
      @adventure.set_out_on_adventure
        flash[:word] = "Your hero has returned!"
      redirect_to hero_path(@adventure.hero)
    else
      redirect_to experience_path
    end
  end

  def adventure_params
    params.require(:adventure).permit(:user_id, :hero_id, :little_sister, :experience_id)
  end

end
