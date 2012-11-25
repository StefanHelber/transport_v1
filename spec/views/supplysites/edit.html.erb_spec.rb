require 'spec_helper'

describe "supplysites/edit" do
  before(:each) do
    @supplysite = assign(:supplysite, stub_model(Supplysite,
      :site_id => 1,
      :supply_quantity => 1.5
    ))
  end

  it "renders the edit supplysite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => supplysites_path(@supplysite), :method => "post" do
      assert_select "input#supplysite_site_id", :name => "supplysite[site_id]"
      assert_select "input#supplysite_supply_quantity", :name => "supplysite[supply_quantity]"
    end
  end
end
