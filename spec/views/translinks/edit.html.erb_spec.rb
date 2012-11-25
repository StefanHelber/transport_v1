require 'spec_helper'

describe "translinks/edit" do
  before(:each) do
    @translink = assign(:translink, stub_model(Translink,
      :supplysite_id => 1,
      :demandsite_id => 1,
      :unit_cost => 1.5,
      :transport_quantity => 1.5
    ))
  end

  it "renders the edit translink form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => translinks_path(@translink), :method => "post" do
      assert_select "input#translink_supplysite_id", :name => "translink[supplysite_id]"
      assert_select "input#translink_demandsite_id", :name => "translink[demandsite_id]"
      assert_select "input#translink_unit_cost", :name => "translink[unit_cost]"
      assert_select "input#translink_transport_quantity", :name => "translink[transport_quantity]"
    end
  end
end
