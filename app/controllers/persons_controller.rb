class PersonsController < ApplicationController
  def index
    @persons = Person.all.paginate(page: params[:page])
  end

def show
  @person = Person.find(params[:id])
end
end
