class Volantino < ActiveRecord::Base
  include ActiveModel::Validations
  attr_accessible :name, :start, :stop

  file_accessor :volantino_file do
    copy_to(:volantino_thumb){ |a| a[0].thumb('147x198#').png }
  end
  image_accessor :volantino_thumb

  validates :name, :start, :stop, :presence => true
  validates_with DateValidator
end
