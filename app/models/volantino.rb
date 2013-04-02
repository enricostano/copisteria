class Volantino < ActiveRecord::Base
  include ActiveModel::Validations
  attr_accessible :name, :start, :stop, :volantino_file, :remove_volantino_file

  file_accessor :volantino_file do
    #copy_to(:volantino_thumb){ |a| a.convert('147x', 'png', '0') }
    copy_to(:volantino_thumb){ |a| a.process(:thumb_pdf_page, '0', '147x', 'png') }
  end
  image_accessor :volantino_thumb do
    after_assign { |a| a.ext = 'png' }
  end

  validates :name, :start, :stop, :presence => true
  validates_with DateValidator
end
