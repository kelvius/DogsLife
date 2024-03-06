class GooddogsController < ApplicationController
  def index
    @gooddogs = Gooddog.all
  end

  def show
    @gooddog = Gooddog.find(params[:id])
  end
end
