class Cart < ActiveRecord::Base
  attr_accessible :shipped
  belongs_to :user
  has_many: :line_items
end
