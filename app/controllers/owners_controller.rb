class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      redirect_to @owner
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])

    if @owner.update(owner_params)
      redirect_to @owner
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def owner_params
      params.require(:owner).permit(:name, :address)
    end
end
