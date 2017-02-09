class PlansController < ApplicationController

  before_filter :authenticate_user! , only: [:new, :create]

  @@amt = "0"

  def index
  	@plans = Plan.all
  end

  def new
  	@amount = params[:amount]
    @@amt = @amount
  end

  def create
      customer = Stripe::Customer.retrieve(current_user.stripe_id)
      customer.sources.create(source: params[:stripeToken])
      @am = @@amt
        Stripe::Charge.create(
            :customer =>  customer.id,
            :amount   =>  @@amt,
            :description  => "Charges By User",
            :currency => 'usd'
           )
        rescue Stripe::CardError  => e
          flash[:error] = e.message
          redirect_to root_path
  end
end
