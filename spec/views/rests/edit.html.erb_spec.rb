require 'spec_helper'

describe "rests/edit" do
  before(:each) do
    @rest = assign(:rest, stub_model(Rest))
  end

  it "renders the edit rest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rest_path(@rest), "post" do
    end
  end
end
