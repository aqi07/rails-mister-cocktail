class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def new
    @dose =Dose.new
    @cocktail =Cocktail.find(params[:cocktail_id])
  end

  def create
    @cocktail =Cocktail.find(params[:cocktail_id])
    @dose= Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktails_path
    else
      render :new
    end
  end


  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end

end
