class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :plan #Associates each user with a SINGLE plan
  has_one :profile

  #Get parameters from forms by whitelisting with attr_accessor
  attr_accessor :stripe_card_token
  def save_with_subscription
    #if user passes Validate fields
    if valid?
      #Set up subscription account with stripe
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id #Save customer token
      save! #You may think save! is a comment, but it actually saves the form to the database
    end
  end
end
