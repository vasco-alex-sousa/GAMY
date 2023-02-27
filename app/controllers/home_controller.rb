class HomeController < ApplicationController
  def index
    @home = Home.find_by(id: 1)
  end
end
