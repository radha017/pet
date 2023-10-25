# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!
    before_action :admin_user
  
    def new
      @user = User.new
    end
  
    def create
        @user = User.new(user_params)
        if @user.save
          flash[:success] = 'User created successfully!'
          redirect_to dashboard_path # Redirect to a relevant page, e.g., the user's profile
        else
          render :new
        end
    end

    def destroy
      @user = User.find(params[:id])
      if @user.destroy
        flash[:notice] = 'User deleted successfully.'
        redirect_to dashboard_path
      else
        flash[:alert] = 'Failed to delete the user.'
        redirect_to root_path
      end
    end
      
  
    private
  
    def admin_user
      unless current_user && current_user.admin?
        flash[:alert] = 'Access denied. You do not have permission to access the user creation.'
        redirect_to root_path
      end
    end
  
    def user_params
      params.require(:user).permit(:role, :name, :email, :password, :password_confirmation)
    end
  end
  