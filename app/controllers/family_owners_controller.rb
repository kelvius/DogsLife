class FamilyOwnersController < ApplicationController
  def index
    @family_owners = FamilyOwner.all
  end

  def show
    @family_owner = FamilyOwner.find(params[:id])
  end
end
