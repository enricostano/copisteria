require 'spec_helper'

describe "volantinos/new" do
  before(:each) do
    assign(:volantino, stub_model(Volantino,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new volantino form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", volantinos_path, "post" do
      assert_select "input#volantino_name[name=?]", "volantino[name]"
    end
  end
end
