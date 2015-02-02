require 'spec_helper'

describe "sedes/show" do
  before(:each) do
    @sede = assign(:sede, stub_model(Sede,
      :descripcion => "Descripcion",
      :direccion => "Direccion",
      :telefono1 => "Telefono1",
      :telefono2 => "Telefono2"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Descripcion/)
    rendered.should match(/Direccion/)
    rendered.should match(/Telefono1/)
    rendered.should match(/Telefono2/)
  end
end
