class FarmersController < ApplicationController
  def index
    @farmers = Farmer.all
  end

  def show
    @farmer = Farmer.find(params[:id])
    @address = @farmer.address
    @ads = @farmer.farmer_instruments
  end

  def new
  end

  def edit
    @farmer = Farmer.find(params[:id])
  end

  def create
    @farmer = Farmer.create(permit_params)
    redirect_to farmers_path
  end

  def update
    @farmer = Farmer.find(params[:id])
    @farmer.update(permit_params)
    redirect_to farmers_path
  end

  private
  def permit_params
    params["farmer"].permit(:first_name, :last_name, :mobile_number, :email)
  end
end
