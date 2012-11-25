require 'spec_helper'

describe "translinks/index" do
  before(:each) do
    assign(:translinks, [
      stub_model(Translink,
        :supplysite_id => 1,
        :demandsite_id => 2,
        :unit_cost => 1.5,
        :transport_quantity => 1.5
      ),
      stub_model(Translink,
        :supplysite_id => 1,
        :demandsite_id => 2,
        :unit_cost => 1.5,
        :transport_quantity => 1.5
      )
    ])
  end

  it "renders a list of translinks" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
