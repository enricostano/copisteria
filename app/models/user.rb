class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :phone, :address, :cap, :city, :partitaiva
  # attr_accessible :title, :body
  validates :phone, :address, :cap, :city, :partitaiva, :presence => true
  validates :cap, :length => { :is => 5 }
  validates :partitaiva, :length => { :is => 11 }
  validates :partitaiva, :cap, :numericality => { :only_integer => true }
  validates :partitaiva, :uniqueness => true
end
