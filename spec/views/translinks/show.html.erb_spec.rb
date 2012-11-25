require 'spec_helper'

describe "translinks/show" do
  before(:each) do
    @translink = assign(:translink, stub_model(Translink,
      :supplysite_id => 1,
      :demandsite_id => 2,
      :unit_cost => 1.5,
      :transport_quantity => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/1.5/)
    rendered.should match(/1.5/)
  end
end
