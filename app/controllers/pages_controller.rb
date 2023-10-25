class PagesController < ApplicationController
  
  def home
    @animals = Animal.where.not(user: current_user).where(is_adopted: false)
  end

  def history
    @for_adoption =  current_user.animals
    @adopts =  current_user.adopts
    
  end

  def requests
    @animal = Animal.find(params[:id])
    @adoption_requests = @animal.adopts
  end

  def cat 
    @cat = Animal.where("LOWER(species) = ?", "cat")
  end

  def dog 
    @dog = Animal.where("LOWER(species) = ?","dog")
  end

  private

  def admin_user
    unless current_user.admin?
      flash[:alert] = 'Access denied. You do not have permission to access the admin dashboard.'
        redirect_to root_path
        end
  end

end
