require 'spec_helper'

describe "dato_contactos/show" do
  before(:each) do
    @dato_contacto = assign(:dato_contacto, stub_model(DatoContacto,
      :telefono_casa => "Telefono Casa",
      :telefono_celu => "Telefono Celu",
      :email => "Email",
      :direccion => "Direccion",
      :ciudad => "Ciudad",
      :cod_postal => "Cod Postal",
      :provincia => "Provincia",
      :otro => "Otro",
      :agrente => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Telefono Casa/)
    rendered.should match(/Telefono Celu/)
    rendered.should match(/Email/)
    rendered.should match(/Direccion/)
    rendered.should match(/Ciudad/)
    rendered.should match(/Cod Postal/)
    rendered.should match(/Provincia/)
    rendered.should match(/Otro/)
    rendered.should match(//)
  end
end
