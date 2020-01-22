require 'rails_helper'
RSpec.describe FarmerInstrument, type: :model do
  before(:all) do
    @farmer = create(:farmer)
    @instrument = create(:instrument)
    @farmer_instrument = create(:farmer_instrument, instrument_id: @instrument.id, farmer_id: @farmer.id)
  end

  it 'Its not valid' do
    # @farmer = Farmer.new(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    expect(@farmer_instrument.valid?).to eq true
  end

  it "Rent must exist" do
    farmer_instrument = build(:farmer_instrument, instrument_id: @instrument.id, farmer_id: @farmer.id, rent_per_hour: nil)
    expect(farmer_instrument).to_not be_valid
  end

  it "Deposit must exist" do
    farmer_instrument = build(:farmer_instrument, instrument_id: @instrument.id, farmer_id: @farmer.id, deposit: nil)
    expect(farmer_instrument).to_not be_valid
  end

  it 'Successfully not inserted the record in database' do
    # @farmer = Farmer.new(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    # farmer_instrument = create(:farmer_instrument, instrument_id: @instrument.id, farmer_id: @farmer.id)
    expect(@farmer_instrument.save).to eq true
  end

end
