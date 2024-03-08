class PersonsController < ApplicationController
  def index
    @persons = Person.all.paginate(page: params[:page])
  end

def show
  @person = Person.find(params[:id])
  @latitude = Person.find(params[:id]).latitude
  @longitude = Person.find(params[:id]).longitude
end
end
