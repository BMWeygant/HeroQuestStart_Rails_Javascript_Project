class ExperiencesController < ApplicationController

  def index
    @experiences = Experience.all
  end

  def new
    @experience = Experience.new
  end

  def create
    @experiences = current_user.experiences.build(experience_params)
    @experience.user_id = current_user.id
      if @adventure.save
        redirect_to user_experiences_path(current_user)
      else
        render 'new'
  end

  private

  def experience_params
    params.require(:hero).permit(:title, :xp, :hp_rating, :treasure_rating)
  end
end
