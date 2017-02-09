class HomeController < ApplicationController
  def index
  	@services = Service.all
  end

  def show 
  	@service = Service.find(params[:id])
  end

end
