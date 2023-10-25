class AdoptsController < ApplicationController
  
  before_action :set_adopt, only: %i[ show edit update destroy ]

  # GET /adopts or /adopts.json
  def index
    @animal = Animal.find(params[:id])
    @adoption_requests = @animal.adopts
  end

  # GET /adopts/1 or /adopts/1.json
  def show
  end

  # GET /adopts/new
  def new
    @animal = Animal.find(params[:animal_id])
    @adopt = @animal.adopts.build
  end

  # GET /adopts/1/edit
  def edit
    @adopt = Adopt.find(params[:id]) # Fetch the adoption request
    @animal = @adopt.animal   
  end

  # POST /adopts or /adopts.json
  def create
    @adopt = Adopt.new(adopt_params)
    @adopt.user = current_user
    @adopt.animal = Animal.find(params[:adopt][:animal_id])
    @adopt.date = Time.now

    respond_to do |format|
      if @adopt.save
        format.html { redirect_to animal_path(@adopt.animal), notice: "Adoption was successfully requested." }
        format.json { render :show, status: :created, location: @adopt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adopt.errors, status: :unprocessable_entity }
        flash[:error] = 'Adoption request creation failed.'
        render :new
      end
    end
  end

  # PATCH/PUT /adopts/1 or /adopts/1.json
  def update
    respond_to do |format|
      if @adopt.update(adopt_params)
        format.html { redirect_to history_path, notice: "Adopt was successfully updated." }
        format.json { render :show, status: :ok, location: @adopt }

        if @adopt.approved?
          # If the current adoption request is approved, reject all other pending requests for the same pet
          @adopt.animal.adopts.pending.where.not(id: @adopt.id).update_all(status: 'rejected')
          @adopt.animal.update(is_adopted: true)
        end
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adopt.errors, status: :unprocessable_entity }
      end
    end
  end



  # DELETE /adopts/1 or /adopts/1.json
  def destroy
    @adopt.destroy

    respond_to do |format|
      format.html { redirect_to animal_path(@adopt.animal), notice: "Adoption was successfully cancelled." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adopt
      @adopt = Adopt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adopt_params
      params.require(:adopt).permit(:user_id, :animal_id, :date, :status, :message)
    end

    
end
