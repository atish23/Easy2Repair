class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :issues
  before_create :user_stripe_id


  def role_enum
   [['admin'],['hardware'],['user']]
  end  
  
  def user_stripe_id
    customer = Stripe::Customer.create(email: email)
    self.stripe_id = customer.id
  end

end
