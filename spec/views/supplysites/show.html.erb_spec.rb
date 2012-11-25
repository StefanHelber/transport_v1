require 'spec_helper'

describe "supplysites/show" do
  before(:each) do
    @supplysite = assign(:supplysite, stub_model(Supplysite,
      :site_id => 1,
      :supply_quantity => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/1.5/)
  end
end
