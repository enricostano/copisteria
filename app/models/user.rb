class User < ActiveRecord::Base
  
  has_and_belongs_to_many :roles
  accepts_nested_attributes_for :roles
  
  has_many :orders, :dependent => :destroy
  has_many :url_connectors, :dependent => :destroy

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :phone, :address, :cap, :city, :partitaiva, :role_ids, :ragionesociale
  
  validates :phone, :address, :cap, :city, :partitaiva, :ragionesociale, :password_confirmation, :presence => true
  validates :cap, :length => { :is => 5 }
  validates :partitaiva, :length => { :is => 11 }
  validates :partitaiva, :cap, :numericality => { :only_integer => true }
  validates :partitaiva, :uniqueness => true

  before_save :setup_role

  def any_role?(*roles)
    return roles.any? { |r| self.roles.map(&:name).include?(r.to_s.camelize) }
  end

  def setup_role
    if self.role_ids.empty?
      self.role_ids = [Role.find_by_name("User").id]
    end
  end
end
