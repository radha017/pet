# app/controllers/admin_controller.rb

class AdminController < ApplicationController
  before_action :authenticate_admin


  def dashboard
    @users = User.where.not(id: current_user.id)
    @pets = Animal.all
  end
  


  

  private

  def authenticate_admin
    # Implement your logic for authenticating admin users
    # This is just a placeholder, customize it as needed
    unless current_user && current_user.admin?
      flash[:alert] = 'Access denied. You do not have permission to access the admin section.'
      redirect_to root_path
    end
  end
end
