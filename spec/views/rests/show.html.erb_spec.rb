require 'spec_helper'

describe "rests/show" do
  before(:each) do
    @rest = assign(:rest, stub_model(Rest))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
