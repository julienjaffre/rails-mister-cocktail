class DosesController < ApplicationController
 before_action :set_dose, only: [:show]


 # GET /cocktails/1
 def show
 end

 # GET /cocktails/new
 def new
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose = Dose.new

 end


 # POST /cockctails
 def create
     @cocktail = Cocktail.find(params[:cocktail_id])
     @dose = Dose.new(dose_params)



     @dose.cocktail = @cocktail

     if @dose.save
       redirect_to cocktail_path(@cocktail), notice: 'Dose was successfully created.'
     else
       render :new
     end
   end

   def destroy
     @dose.destroy
     redirect_to restaurants_url, notice: 'Dose was successfully destroyed.'
   end

   private
     # Use callbacks to share common setup or constraints between actions.
     def set_dose
       @dose = Dose.find(params[:id])
     end

     # Only allow a trusted parameter "white list" through.
     def dose_params
       params.require(:dose).permit(:description, :ingredient_id)
     end
end
