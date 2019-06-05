class AdventuresController < ApplicationController

  def index
    @adventures =Adventure.all
  end
end
