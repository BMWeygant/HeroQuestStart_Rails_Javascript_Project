class AdventuresController < ApplicationController

  def index
    @adventures =Adventure.all
  end

  def new
    @adventure = Adventure.new
  end

  def create
    @adventure = Adventure.new(adventure_params)
    @adventure.user_id = current_user.id
    @adventure.hero_id = @hero.id

      if @adventure.save
        redirect_to hero_adventures_path
      else
        render 'new'
      end
  end

  def show
    @adventure = Adventure.find(params[:id])
  end

  private

  def adventure_params
    params.require(:adventure).permit(:title, :user_id, :hero_id)
  end
end
