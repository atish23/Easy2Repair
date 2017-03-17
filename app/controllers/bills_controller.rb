class BillsController < ApplicationController
  before_action :set_bill, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html

  def index
    @bills = Bill.all
    respond_with(@bills)
  end

  def show
    respond_with(@bill)
  end

  def new
    @bill = Bill.new
    respond_with(@bill)
  end

  def edit
  end

  def create
    # raise params.inspect
    @bill = Bill.new(bill_params)
    @bill.save
    redirect_to bills_path
  end

  def update
    @bill.update(bill_params)
    redirect_to bills_path
    # respond_with(@bill)
  end

  def destroy
    @bill.destroy
    respond_with(@bill)
  end

  private
    def set_bill
      @bill = Bill.find(params[:id])
    end

    def bill_params
      params.require(:bill).permit(:amount, :tax, :total, :issue_id,:description)
    end
end
