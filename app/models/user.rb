class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :company_name, presence: true
  validates :company_name, uniqueness: true
  validates :coc, presence: true
  validates :coc, uniqueness: true
  validates :mobile_nr, presence: true
  validates :mobile_nr, uniqueness: true
  validates :mobile_nr, numericality: true

end
