class UsersController < ApplicationController
    before_action :require_admin, only: [:index]
    def index
        @users = User.all
    end

    def unblock
        @user = User.find(params[:id])
        if @user.is_block==true
        @user.update_attribute(:is_block, false)
        redirect_to users_path
        else
        @user.update_attribute(:is_block, true)
        redirect_to users_path
        end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            redirect_to users_path
        else
            render 'edit'
        end
    end

    private

        def require_admin
            redirect_to root_path unless current_user.admin?
        end

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
        end
end
