class HerosController < ApplicationController

  def index
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = Hero.new(hero_params)
  end

  private

  def hero_params
    params.require(:hero).permit(:name, :hp, :treasure, :total_xp)
  end
end
