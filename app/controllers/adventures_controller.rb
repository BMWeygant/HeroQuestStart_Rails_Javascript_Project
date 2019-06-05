class AdventuresController < ApplicationController

  def index
    @adventures =Adventure.all
  end

  def new
    @adventure = Adventure.new
  end

  def create
    @adventure = current_user.adventures.build(adventure_params)
    @adventure.user_id = current_user.id
      if @adventure.save
        redirect_to adventures_path
      else
        render 'new'
      end
  end

  def show
    @adventure = Adventure.find(params[:id])
  end

  private

  def adventure_params
    params.require(:adventure).permit(:title, :hp_rating, :treasure_rating, :user_id)
  end
end
