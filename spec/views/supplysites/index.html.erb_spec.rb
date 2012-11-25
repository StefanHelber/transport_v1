require 'spec_helper'

describe "supplysites/index" do
  before(:each) do
    assign(:supplysites, [
      stub_model(Supplysite,
        :site_id => 1,
        :supply_quantity => 1.5
      ),
      stub_model(Supplysite,
        :site_id => 1,
        :supply_quantity => 1.5
      )
    ])
  end

  it "renders a list of supplysites" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
