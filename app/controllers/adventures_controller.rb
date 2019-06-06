class AdventuresController < ApplicationController

  def create
    @adventure = Adventure.new
    @hero = Hero.find_by(params[:id])
    if @adventure
      redirect_to hero_path(@hero)
    else
      redirect_to experience_path
    end
  end

end
