class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[ show edit update destroy ]

  # GET /animals or /animals.json
  def index
    @animals = Animal.where.not(user: current_user).where(is_adopted: false).order(created_at: :desc)
  end

  # GET /animals/1 or /animals/1.json
  def show
    @animal = Animal.find(params[:id])
    @adoption_requests = @animal.adopts
  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals or /animals.json
  def create
    @animal = Animal.new(animal_params)
    @animal.user_id = current_user.id

    respond_to do |format|
      if @animal.save
        format.html { redirect_to animal_url(@animal), notice: "Pet was successfully added to listing." }
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1 or /animals/1.json
  def update
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to animal_url(@animal), notice: "Pet was successfully updated." }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1 or /animals/1.json
  def destroy
    @animal = Animal.find(params[:id])
    @adopt = current_user.adopts.find_by(animal_id: @animal.id)
  
    if current_user.admin?
      # An admin can delete any animal
      @animal.adopts.destroy_all
      @animal.destroy
  
      respond_to do |format|
        format.html { redirect_to dashboard_path, notice: "Pet is successfully deleted from the listing" }
        format.json { head :no_content }
      end
    elsif @adopt
      # A regular user can cancel their own adoption request
      @adopt.destroy
  
      respond_to do |format|
        format.html { redirect_to animals_url, notice: "Adoption request was successfully cancelled." }
        format.json { head :no_content }
      end
    elsif @animal.user == current_user
      # A regular user can delete their own animals
      @animal.adopts.destroy_all
      @animal.destroy
  
      respond_to do |format|
        format.html { redirect_to animals_url, notice: "Pet were successfully deleted." }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to animals_url, alert: "You can only cancel your own adoption requests or delete your own pet listing." }
        format.json { head :unprocessable_entity }
      end
    end
  end
  
  
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def animal_params
      params.require(:animal).permit(:name, :species, :breed, :age, :description, :is_adopted, :user_id, :image)
    end
end
