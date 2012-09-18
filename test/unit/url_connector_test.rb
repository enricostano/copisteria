require 'test_helper'

class UrlConnectorTest < ActiveSupport::TestCase
  test "should not save empty url_connector" do
    url_connector = UrlConnector.new
    assert url_connector.invalid?
    assert url_connector.errors[:line_item].any?
    assert url_connector.errors[:user].any?
    assert url_connector.errors[:temp_url].any?
    assert !url_connector.save, "Saved empty UrlConnector"
  end

end
