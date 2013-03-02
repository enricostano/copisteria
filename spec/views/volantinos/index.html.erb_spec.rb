require 'spec_helper'

describe "volantinos/index" do
  before(:each) do
    assign(:volantinos, [
      stub_model(Volantino,
        :name => "Name"
      ),
      stub_model(Volantino,
        :name => "Name"
      )
    ])
  end

  it "renders a list of volantinos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
