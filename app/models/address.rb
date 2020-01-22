class Address < ApplicationRecord
  belongs_to :farmer

  validates :line1, :city, :state, :country, presence: true
  validates :pincode, :numericality => true, :length => { is: 6 }
  validates :farmer_id ,uniqueness: true

  before_save :titleize_names
  def titleize_names
    self.city = self.city.titleize
    self.state = self.state.titleize
    self.country = self.country.titleize
  end

end
