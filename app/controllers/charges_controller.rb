class ChargesController < ApplicationController
  
  def new
    @stripe_btn_data = {
       email: current_user.email,
       key: "#{ Rails.configuration.stripe[:publishable_key] }",
       description: "Blocipedia Upgrade",
       amount: Amount.default
    }
  end

  def create
    # Creates a Stripe Customer object, for associating
    # with the charge
    customer = Stripe::Customer.create(
     email: current_user.email, # params[:stripeEmail],
     card: params[:stripeToken]
    )

    # Where the real magic happens
    charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: Amount.default,
     description: "Blocipedia Membership - #{current_user.email}",
     currency: 'usd'
    )

    flash[:notice] = "Thanks for upgrading, #{current_user.email}! You are now a premium member."
    current_user.role = "premium"
    current_user.save
    redirect_to wikis_path # or wherever
   
    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
    rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
  end

  def downgrade
    @user = current_user
    @user.role = "standard"
    if @user.save
      flash[:notice] = "You have successfully downgraded you account to standard."
      redirect_to wikis_path
    end
  end

end

class Amount 
  @@default = 200
  def self.default
    @@default
  end
end