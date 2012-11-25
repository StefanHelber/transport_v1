require 'spec_helper'

describe "demandsites/show" do
  before(:each) do
    @demandsite = assign(:demandsite, stub_model(Demandsite,
      :site_id => 1,
      :demand_quantity => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/1.5/)
  end
end
