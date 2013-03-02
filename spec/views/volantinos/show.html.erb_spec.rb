require 'spec_helper'

describe "volantinos/show" do
  before(:each) do
    @volantino = assign(:volantino, stub_model(Volantino,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
