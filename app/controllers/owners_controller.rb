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
    @owner = Owner.new(name:"...",address:"...")

    if @owner.save
      redirect_to @owner
    else
      render :new, status: :unprocessable_entity
    end
  end
end
