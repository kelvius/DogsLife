class GooddogsController < ApplicationController
  def index
    @gooddogs = Gooddog.all
  end
end
