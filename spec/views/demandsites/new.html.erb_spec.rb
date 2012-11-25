require 'spec_helper'

describe "demandsites/new" do
  before(:each) do
    assign(:demandsite, stub_model(Demandsite,
      :site_id => 1,
      :demand_quantity => 1.5
    ).as_new_record)
  end

  it "renders new demandsite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => demandsites_path, :method => "post" do
      assert_select "input#demandsite_site_id", :name => "demandsite[site_id]"
      assert_select "input#demandsite_demand_quantity", :name => "demandsite[demand_quantity]"
    end
  end
end
