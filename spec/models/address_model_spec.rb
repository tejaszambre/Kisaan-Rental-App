require 'rails_helper'
RSpec.describe Farmer, type: :model do
  before(:all) do
    @farmer = create(:farmer)
  end

  it 'Its not valid' do
    address = create(:address, farmer_id: @farmer.id)
    expect(address.valid?).to eq true
  end

  it "has a unique farmer" do
    address = create(:address, farmer_id: @farmer.id)
    # address = create(:address, email: "tzambre@gmail.com")
    expect(address).to be_valid
  end

  it "line1 must exist" do
    address = build(:address, line1: nil, farmer_id: @farmer.id)
    expect(address).to_not be_valid
  end

  it "city must exist" do
    address = build(:address, city: nil, farmer_id: @farmer.id)
    expect(address).to_not be_valid
  end

  it "state must exist" do
    address = build(:address, state: nil, farmer_id: @farmer.id)
    expect(address).to_not be_valid
  end

  it "country must exist" do
    address = build(:address, country: nil, farmer_id: @farmer.id)
    expect(address).to_not be_valid
  end

  it "It should titleize strings" do
    address = create(:address, farmer_id: @farmer.id)
    expect(address.titleize_names).to eq "#{address.country.titleize}"
  end


  it 'Successfully not inserted the record in database' do
    address = create(:address, farmer_id: @farmer.id)
    expect(address.save).to eq true
  end

end
