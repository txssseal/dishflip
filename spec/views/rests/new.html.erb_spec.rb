require 'spec_helper'

describe "rests/new" do
  before(:each) do
    assign(:rest, stub_model(Rest).as_new_record)
  end

  it "renders new rest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rests_path, "post" do
    end
  end
end
