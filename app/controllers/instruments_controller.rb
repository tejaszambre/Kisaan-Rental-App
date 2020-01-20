class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def new
  end

  def show
    @instrument = Instrument.find(params[:id])
    @farmers = @instrument.farmer_instruments.group(:farmer_id).map {|a| a.farmer}
  end

  def edit
    # byebug
    @instrument = Instrument.find(params[:id])
  end

  def create
    # byebug
    @instruments = Instrument.create(permit_params)
    redirect_to instruments_path
  end

  def update
    byebug
    @instrument = Instrument.find(params[:id])
    @instrument.update(permit_params)
    redirect_to instruments_path
  end

  private
  def permit_params
    params["instrument"].permit(:name, :brand, :specification)
  end
end
