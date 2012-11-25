require 'spec_helper'

describe "supplysites/new" do
  before(:each) do
    assign(:supplysite, stub_model(Supplysite,
      :site_id => 1,
      :supply_quantity => 1.5
    ).as_new_record)
  end

  it "renders new supplysite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => supplysites_path, :method => "post" do
      assert_select "input#supplysite_site_id", :name => "supplysite[site_id]"
      assert_select "input#supplysite_supply_quantity", :name => "supplysite[supply_quantity]"
    end
  end
end
