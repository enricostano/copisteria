class UrlConnector < ActiveRecord::Base
  attr_accessible :active, :order_id, :real_url, :temp_url, :user_id
  belongs_to :user
  belongs_to :line_item
end
