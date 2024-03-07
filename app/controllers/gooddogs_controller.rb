class GooddogsController < ApplicationController

  def index
    @gooddogs = Gooddog.all

    # Apply search filtering if search parameters are provided
    if params[:search].present?
      case params[:category]
      when 'all'
        @gooddogs = @gooddogs.joins(:breed).where("gooddogs.name LIKE :search OR breeds.name LIKE :search OR gooddogs.favoritetreat LIKE :search", search: "%#{params[:search]}%")
      when 'name'
        @gooddogs = @gooddogs.where("name LIKE ?", "%#{params[:search]}%")
      when 'breed'
        @gooddogs = @gooddogs.joins(:breed).where("breeds.name LIKE ?", "%#{params[:search]}%")
      when 'favoritetreat'
        @gooddogs = @gooddogs.where("favoritetreat LIKE ?", "%#{params[:search]}%")
      end
    end

    @gooddogs = @gooddogs.paginate(page: params[:page])
  end

  def show
    @gooddog = Gooddog.find(params[:id])
  end
end
