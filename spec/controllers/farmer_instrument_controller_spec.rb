require 'rails_helper'

RSpec.describe FarmerInstrumentsController, type: :controller do
  before(:all) do
    @farmer = create(:farmer)
    @instrument = create(:instrument)
    @farmer_instrument = create(:farmer_instrument, instrument_id: @instrument.id, farmer_id: @farmer.id)
  end

  it 'Its should save data and return 200 status code' do
    # Farmer.create(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    # Instrument.create(name:"Harvester", brand: "Mahindra", specification: "grain")
    # @farmer_instrument = FarmerInstrument.create(rent_per_hour:"5000", deposit: "6000", is_available: true, available_till: '2020-1-20', farmer_id:1, instrument_id:1)
    farmer_instrument = create(:farmer_instrument, instrument_id: @instrument.id, farmer_id: @farmer.id)
    get :index
    expect(response).to have_http_status(:success)
  end
  it "renders the index template" do
    get :index
    expect(response).to render_template("index")
  end
  # it 'Successfully not   inserted the record in database' do
  #   @farmer = Farmer.new(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
  #   expect(@farmer.save).to eq true
  # end
end
