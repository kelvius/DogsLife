class DogsController < ApplicationController
  http_basic_authenticate_with name: "1", password: "1", only: :destroy

  def create
    @owner = Owner.find(params[:owner_id])
    @dog = @owner.dogs.create(dog_params)
    redirect_to owner_path(@owner)
  end

  def destroy
    @owner = Owner.find(params[:owner_id])
    @dog = @owner.dogs.find(params[:id])
    @dog.destroy
    redirect_to owner_path(@owner), status: :see_other
  end

  private
    def dog_params
      params.require(:dog).permit(:name, :breed, :subbreed, :status)
    end
end
