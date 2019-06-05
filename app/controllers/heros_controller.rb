class HerosController < ApplicationController

  def index
    @heros = Hero.all.order("created_at DESC")
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = current_user.heros.build(hero_params)
    @hero.user_id = current_user.id
      if @hero.save
        redirect_to heros_path
      else
        render 'new'
      end
  end

  def show
    #binding.pry
    @hero = Hero.find(params[:id])
  end

  def destroy
    @hero.destroy
    redirect_to heros_path
  end
  private

  def hero_params
    params.require(:hero).permit(:name, :hp, :treasure, :total_xp, :user_id)
  end
end
