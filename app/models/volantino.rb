class Volantino < ActiveRecord::Base
  include ActiveModel::Validations
  attr_accessible :name, :start, :stop

  validates :name, :start, :stop, :presence => true
  validates_with DateValidator
end
