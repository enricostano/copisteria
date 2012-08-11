class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :project_id
  belongs_to :cart
end
