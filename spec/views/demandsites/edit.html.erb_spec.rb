require 'spec_helper'

describe "demandsites/edit" do
  before(:each) do
    @demandsite = assign(:demandsite, stub_model(Demandsite,
      :site_id => 1,
      :demand_quantity => 1.5
    ))
  end

  it "renders the edit demandsite form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => demandsites_path(@demandsite), :method => "post" do
      assert_select "input#demandsite_site_id", :name => "demandsite[site_id]"
      assert_select "input#demandsite_demand_quantity", :name => "demandsite[demand_quantity]"
    end
  end
end
