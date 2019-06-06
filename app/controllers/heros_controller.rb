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
        redirect_to user_heros_path(current_user)
      else
        render 'new'
      end
  end

  def show
    @hero = Hero.find(params[:id])
  end

  def update

  end

  def destroy
    @hero = Hero.find(params[:id])
    @hero.destroy
    redirect_to user_heros_path(current_user)
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :hp, :treasure, :total_xp, :incapacitated, :user_id)
  end
end
