require 'rails_helper'
RSpec.describe Farmer, type: :model do
  it 'Its not valid' do
    # @farmer = Farmer.new(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    @farmer = create(:farmer)
    expect(@farmer.valid?).to eq true
  end

  it "has a unique and proper email" do
    farmer = create(:farmer, email: "tzambre@gmail.com")
    # farmer = create(:farmer, email: "tzambre@gmail.com")
    expect(farmer).to be_valid
  end

  it "email must exist" do
    farmer = build(:farmer, email: nil)
    expect(farmer).to_not be_valid
  end

  it "first_name must exist" do
    farmer = build(:farmer, first_name: nil)
    expect(farmer).to_not be_valid
  end

  it "last_name must exist" do
    farmer = build(:farmer, last_name: nil)
    expect(farmer).to_not be_valid
  end

  it "has a unique and proper mobile" do
    farmer = build(:farmer, mobile_number: "8080808080")
    expect(farmer).to be_valid
  end

  it "mobile must exist" do
    farmer = build(:farmer, mobile_number: nil)
    expect(farmer).to_not be_valid
  end

  it 'Successfully not inserted the record in database' do
    # @farmer = Farmer.new(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    farmer = create(:farmer)
    expect(farmer.save).to eq true
  end

  it "full name should work" do
    # get :full_name, first_name, last_name
    farmer = create(:farmer)
    expect(farmer.full_name).to eq "#{farmer.first_name} #{farmer.last_name}"
    # expect(response).should == "tejas zambre"
  end

  it "It should titleize strings" do
    # get :full_name, first_name, last_name
    farmer = create(:farmer)
    expect(farmer.titleize_names).to eq "#{farmer.last_name.titleize}"
    # expect(response).should == "tejas zambre"
  end


end
