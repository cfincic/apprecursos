require 'spec_helper'

describe "areas/show" do
  before(:each) do
    @area = assign(:area, stub_model(Area,
      :descripcion => "Descripcion",
      :jefe => "Jefe",
      :esdire => "",
      :madre => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Descripcion/)
    rendered.should match(/Jefe/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
