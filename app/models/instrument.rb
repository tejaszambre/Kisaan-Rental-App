class Instrument < ApplicationRecord
  has_many :farmers, through: :farmer_instruments
  has_many :farmer_instruments
  # has_many :rents, through: :farmer_instruments

  validates :name, :brand, :specification, presence: true

  before_save :titleize_names
  def titleize_names
    self.name = self.name.titleize
    self.brand = self.brand.titleize
    self.specification = self.specification.titleize
  end

end
