class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  # GET / cockctails
  def index
    @cocktails = Cocktail.all
  end

  # GET /cockctails/1
  def show
  end

  # GET /cockctails/new
  def new
    @cocktail = Cocktail.new
  end


  # POST /cockctails
  def create
      @cocktail = Cocktail.new(cocktail_params)

      if @cocktail.save
        redirect_to @cocktail, notice: 'Cocktail was successfully created.'
      else
        render :new
      end
    end


    private
      # Use callbacks to share common setup or constraints between actions.
      def set_cocktail
        @cocktail = Cocktail.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def cocktail_params
        params.require(:cocktail).permit(:name)
      end
  end
