class GooddogsController < ApplicationController

  def index
    @gooddogs = Gooddog.all.paginate(page: params[:page])

  end

  def show
    @gooddog = Gooddog.find(params[:id])
  end
end
