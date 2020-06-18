class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products
  # validates :name, presence: true
  # validates :email, presence: true
  # validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i   
  # validates :address, presence: true
  # validates :city, presence: true
  # validates :state, presence: true, numericality: { only_integer: true }
  # validates :zip, presence: true, numericality: { only_integer:true}, length: { is: 5 }
  # validates :password, presence: true, length: { minimum: 6 }
end
