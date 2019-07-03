class HerosController < ApplicationController
before_action :authenticate_user!

  def index
    @heros = Hero.all.seniority
    respond_to do |f|
        f.html {render :index}
        f.json {render json: @heros}
      end
  end

  def new
    @hero = Hero.new
  end

  def create
    @hero = current_user.heros.build(hero_params)
    @hero.user_id = current_user.id
      if @hero.save
        render json: @hero
        flash[:word] = "Your hero is ready to serve!"
        redirect_to hero_path(@hero)
      else
        render 'new'
      end
  end

  def show
    @hero = Hero.find(params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @hero}
    end
  end

  def update
    @hero.update(hero_params)
      if @hero.save!
        redirect_to hero_path(@hero)
      else
      flash[:word] =  "Something went wrong. Your adventure has been cancelled"
        redirect_to root_path
      end
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
