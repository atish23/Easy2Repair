class ContactusController < ApplicationController
  before_action :set_contactu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @contactus = Contactu.all
    respond_with(@contactus)
  end

  def show
    respond_with(@contactu)
  end

  def new
    @contactu = Contactu.new
    respond_with(@contactu)
  end

  def edit
  end

  def create
    @contactu = Contactu.new(contactu_params)
    @contactu.save
    # respond_with(@contactu)
    redirect_to root_path
  end

  def update
    @contactu.update(contactu_params)
    respond_with(@contactu)
  end

  def destroy
    @contactu.destroy
    respond_with(@contactu)
  end

  private
    def set_contactu
      @contactu = Contactu.find(params[:id])
    end

    def contactu_params
      params.require(:contactu).permit(:name, :email, :feedback)
    end
end
