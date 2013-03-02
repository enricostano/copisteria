require 'spec_helper'

describe "volantinos/edit" do
  before(:each) do
    @volantino = assign(:volantino, stub_model(Volantino,
      :name => "MyString"
    ))
  end

  it "renders the edit volantino form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", volantino_path(@volantino), "post" do
      assert_select "input#volantino_name[name=?]", "volantino[name]"
    end
  end
end
