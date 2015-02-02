require 'spec_helper'

describe "sedes/index" do
  before(:each) do
    assign(:sedes, [
      stub_model(Sede,
        :descripcion => "Descripcion",
        :direccion => "Direccion",
        :telefono1 => "Telefono1",
        :telefono2 => "Telefono2"
      ),
      stub_model(Sede,
        :descripcion => "Descripcion",
        :direccion => "Direccion",
        :telefono1 => "Telefono1",
        :telefono2 => "Telefono2"
      )
    ])
  end

  it "renders a list of sedes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
    assert_select "tr>td", :text => "Direccion".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono1".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono2".to_s, :count => 2
  end
end
