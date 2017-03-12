class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  respond_to :html

  def index
    @issues = current_user.issues
    respond_with(@issues)
  end

  def show
    respond_with(@issue)
  end

  def my_plans
    charges = Stripe::Charge.list(customer: current_user.stripe_id)
    @data = charges.data
  end

  def new
    @issue = Issue.new
    respond_with(@issue)
  end

  def edit
  end

  def create
    @issue = Issue.new(issue_params)
    @issue.save
    @user = current_user
    Issue.send_text_message(current_user)
    #UserMailer.welcome_email(@user).deliver!
    redirect_to issues_path
  end

  def update
    @issue.update(issue_params)
    respond_with(@issue)
  end

  def destroy
    @issue.destroy
    respond_with(@issue)
  end

  private
    def set_issue
      @issue = Issue.find(params[:id])
    end

    def issue_params
      params.require(:issue).permit(:device, :desc, :user_id, :type_of_problem, :delivery)
    end
end
