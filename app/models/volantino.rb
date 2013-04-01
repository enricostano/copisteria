class Volantino < ActiveRecord::Base
  include ActiveModel::Validations
  attr_accessible :name, :start, :stop, :volantino_file, :remove_volantino_file

  file_accessor :volantino_file do
    copy_to(:volantino_thumb){ |a| a.thumb('147x').png }
  end
  image_accessor :volantino_thumb do
    after_assign { |a| a.ext = 'png' }
  end

  validates :name, :start, :stop, :presence => true
  validates_with DateValidator
end
