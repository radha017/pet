class PagesController < ApplicationController
  
  def home
    @animals = Animal.where.not(user: current_user).where(is_adopted: false)
  end

  def history
    @for_adoption =  current_user.animals.order(created_at: :desc)
    @adopts =  current_user.adopts.order(created_at: :desc)
    
  end

  def requests
    @animal = Animal.find(params[:id])
    @adoption_requests = @animal.adopts.order(created_at: :desc)
  end

  def cat 
    @cat = Animal.where("LOWER(species) = ?", "cat").order(created_at: :desc)
  end

  def dog 
    @dog = Animal.where("LOWER(species) = ?","dog").order(created_at: :desc)
  end

  private

  def admin_user
    unless current_user.admin?
      flash[:alert] = 'Access denied. You do not have permission to access the admin dashboard.'
        redirect_to root_path
        end
  end

end
