require 'spec_helper'

describe "rests/index" do
  before(:each) do
    assign(:rests, [
      stub_model(Rest),
      stub_model(Rest)
    ])
  end

  it "renders a list of rests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
