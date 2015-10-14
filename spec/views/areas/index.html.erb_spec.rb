require 'spec_helper'

describe "areas/index" do
  before(:each) do
    assign(:areas, [
      stub_model(Area,
        :descripcion => "Descripcion",
        :jefe => "Jefe",
        :esdire => "",
        :madre => ""
      ),
      stub_model(Area,
        :descripcion => "Descripcion",
        :jefe => "Jefe",
        :esdire => "",
        :madre => ""
      )
    ])
  end

  it "renders a list of areas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
    assert_select "tr>td", :text => "Jefe".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
