require 'rails_helper'
RSpec.describe Rent, type: :model do
  before(:all) do
    @farmer = create(:farmer)
    @instrument = create(:instrument)
    @farmer_instrument = create(:farmer_instrument, instrument_id: @instrument.id, farmer_id: @farmer.id)
  end

  it 'Its not valid' do
    # @farmer = Farmer.new(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    @rent = create(:rent, farmer_id: @farmer.id, farmer_instrument_id: @farmer_instrument.id)
    expect(@rent.valid?).to eq true
  end

  it "From date must exist" do
    rent = build(:rent, from_date: nil, farmer_id: @farmer.id, farmer_instrument_id: @farmer_instrument.id)
    expect(rent).to_not be_valid
  end

  it "To date must exist" do
    rent = build(:rent, to_date: nil, farmer_id: @farmer.id, farmer_instrument_id: @farmer_instrument.id)
    expect(rent).to_not be_valid
  end

  it 'Successfully not inserted the record in database' do
    # @farmer = Farmer.new(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    rent = create(:rent, farmer_id: @farmer.id, farmer_instrument_id: @farmer_instrument.id)
    expect(rent.save).to eq true
  end

end
