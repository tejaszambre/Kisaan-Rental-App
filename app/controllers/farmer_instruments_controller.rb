class FarmerInstrumentsController < ApplicationController

  def index
    @ads = FarmerInstrument.all.includes(:farmer, :instrument)
    @farmer = Farmer
  end

  def show
    @ads = FarmerInstrument.where(id: params[:id]).first
    @instrument = @ads.instrument
    @farmer = @ads.farmer
    @address = @ads.farmer.address
  end

  def new
    @ads = FarmerInstrument.where(id: params[:id]).first
  end

  def edit
    # byebug
    @ads = FarmerInstrument.where(id: params[:id]).first
  end

  def create
    # byebug
    @ads = FarmerInstrument.create(permit_params)
    # if @ads.errors.any?
    # render :new
    # else
    redirect_to farmer_instruments_path
    # end
    # render farmer_instruments_path
    # redirect_to farmer_instrument_path(@farmer_instrument_path)
    # render :new
  end

  def update
    @ad = FarmerInstrument.find(params[:id])
    @ad.update(permit_params)
    redirect_to farmer_instruments_path
  end

  private
  def permit_params
    params["farmer_instrument"].permit( :rent_per_hour, :deposit, :is_available, :farmer_id, :instrument_id, :next_available, :available_till)
  end

end
