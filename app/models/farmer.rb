class Farmer < ApplicationRecord
  has_one :address, dependent: :destroy
  has_many :instruments, through: :farmer_instruments 
  has_many :farmer_instruments, dependent: :destroy
  has_many :rents
  has_many :rented_farmer_instruments, through: :rents, foreign_key: :farmer_instrument_id

  validates :mobile_number, :first_name, :last_name, presence: true
  # validates :email, format: { with: /\A[a-zA-Z0-9]+[@]{1}[0-9a-zA-Z]+[.]{1}[0-9a-zA-Z]+\z/, message: "Please enter proper Email"}
  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :mobile_number, :numericality => true, uniqueness: true, :length => { is: 10}

  before_save :titleize_names
  def titleize_names
    self.first_name = self.first_name.titleize
    self.last_name = self.last_name.titleize
  end

  def full_name
    self.first_name.to_s + " " + self.last_name.to_s
  end
end
