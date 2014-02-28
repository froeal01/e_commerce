class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :credit_cards



  def stripe_member?(user_id, token)
  	@user = User.find(user_id)
  	if @user.stripe_user_id 
  		return @user.stripe_user_id
  	else
  		create_new_stripe_user(token)
  	end
  end

  def create_new_stripe_user(token)
   if	new_user = Stripe::Customer.create(card: token)
   		CreditCard.create(user_id: @user.id) #need to refactor this out. too much dependency
   	 @user.stripe_user_id =  new_user["id"]
   	 @user.save
   	 @user.stripe_user_id
   end
  end

  

end
