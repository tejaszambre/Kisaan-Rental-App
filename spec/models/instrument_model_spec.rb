require 'rails_helper'
RSpec.describe Instrument, type: :model do
  it 'Its not valid' do
    # @farmer = Farmer.new(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    @instrument = create(:instrument)
    expect(@instrument.valid?).to eq true
  end

  it "Name must exist" do
    instrument = build(:instrument, name: nil)
    expect(instrument).to_not be_valid
  end

  it "Brand must exist" do
    instrument = build(:instrument, brand: nil)
    expect(instrument).to_not be_valid
  end

  it "specification must exist" do
    instrument = build(:instrument, specification: nil)
    expect(instrument).to_not be_valid
  end

  it 'Successfully not inserted the record in database' do
    # @farmer = Farmer.new(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    instrument = create(:instrument)
    expect(instrument.save).to eq true
  end

end
