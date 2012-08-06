class Institution < ActiveRecord::Base
  attr_accessible :email, :name, :phone
  has_many :projects, :dependent => :destroy
  validates :email, :name, :phone, :presence => true
end
