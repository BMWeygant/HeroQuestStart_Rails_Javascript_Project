class HerosController < ApplicationController

  def index
    @heros = Hero.all.order("created_at DESC")
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
    #binding.pry
    @hero.save
      if @hero.save
        redirect_to 'heros_path'
      else
        render 'new'
      end
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :hp, :treasure, :total_xp)
  end
end
