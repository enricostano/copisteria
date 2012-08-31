class Order < ActiveRecord::Base
  attr_accessible :user_id

  belongs_to :user
  has_many :line_items, :dependent => :destroy
  accepts_nested_attributes_for :line_items, :allow_destroy => true
end
