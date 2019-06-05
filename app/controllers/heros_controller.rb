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
    #raise params
    #inding.pry
      if @hero.save
        redirect_to heros_path
      else
        render 'new'
      end
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :hp, :treasure, :total_xp, :user_id)
  end
end
