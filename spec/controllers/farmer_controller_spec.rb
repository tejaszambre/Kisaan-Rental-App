require 'rails_helper'

RSpec.describe FarmersController, type: :controller do

  it 'Its should save data and return 200 status code' do
    @farmer = create(:farmer)
    get :index
    expect(response).to have_http_status(:success)
    # Farmer.create(first_name: "tejas", last_name: "Zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    # Instrument.create(name:"Harvester", brand: "Mahindra", specification: "grain")
    # @farmer_instrument = FarmerInstrument.create(rent_per_hour:"5000", deposit: "6000", is_available: true, available_till: '2020-1-20', farmer_id:1, instrument_id:1)
  end

  it "It should show" do
    @farmer = create(:farmer)
    params1 = {id: @farmer.id}
    get :show, params: params1
    expect(response).to render_template :show
  end

  it "It should edit" do
    @farmer = create(:farmer)
    params1 = {id: @farmer.id}
    get :edit, params: params1
    expect(response).to render_template :edit
  end

  it "It should render to farmers_path if creation passed" do
    @farmer = create(:farmer, first_name: "tejas", last_name: "zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    params1 = { "farmer" => {first_name: "sagar", last_name: "sonwane", mobile_number: "8080808082", email: "tzambre68@gmail.com"}}
    post :create, params: params1
    expect(response).to redirect_to( :action => 'index')
    # expect(response).to redirect_to(farmer_path)
  end
  it "It should render to new_farmer_path if creation failed" do
    @farmer = create(:farmer, first_name: "tejas", last_name: "zambre", mobile_number: "8080808080", email: "tzambre681@gmail.com")
    params1 = { "farmer" => {first_name: "sagar", last_name: "sonwane", mobile_number: "8080808080", email: "tzambre681@gmail.com"}}
    post :create, params: params1
    expect(response).to redirect_to( :action => 'new')
    # expect(response).to have_http_status(:success)
    # assert_response :success
    # expect(response).to have_http_status new_farmer_path
    # response.should render_template :index
    # expect(response).to redirect_to(farmer_path)
  end

  it "It should render to farmer_path if updation passed" do
    @farmer = create(:farmer, first_name: "tejas", last_name: "zambre")
    params2 = {id: @farmer.id, "farmer" => {first_name: "sagar", last_name: "sonwane"}}
    put :update, params: params2
    expect(response).to redirect_to( :action => 'show', :id => @farmer)
  end

  it "It should render to farmer_path if updation failed" do
    @farmer = create(:farmer)
    @farmer1 = create(:farmer)
    params2 = {id: @farmer1.id, "farmer" => {first_name: "sagar", last_name: "sonwane", mobile_number: @farmer.mobile_number}}
    put :update, params: params2
    expect(response).to redirect_to( :action => 'index')
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
