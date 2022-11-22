class RegistrationsController < Devise::RegistrationsController
    
 def new
    @user = User.new
 end

 def create
    @user = User.new(sign_up_params)
    if @user.save
        redirect_to root_path
        flash[:notice] = "A registration email has been sent to your email address. Please follow the instructions in the email to activate your account."
    else
        render 'devise/registrations/new'
        flash[:alert] = "There was a problem creating your account. Please try again."
    end
 end

 private

    def sign_up_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation,:avatar)
    end

end