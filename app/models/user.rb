class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :posts, dependent: :destroy

  validates :terms, acceptance: true

  def profile_incomplete?
    self.company_name.nil? || self.company_name == ""
    self.first_name.nil? || self.first_name == ""
    self.last_name.nil? || self.last_name == ""
    self.coc.nil? || self.coc == ""
    self.vat.nil? || self.vat == ""
    self.company_address.nil? || self.company_address == ""
  end
end
