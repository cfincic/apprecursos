require 'spec_helper'

describe "dato_contactos/index" do
  before(:each) do
    assign(:dato_contactos, [
      stub_model(DatoContacto,
        :telefono_casa => "Telefono Casa",
        :telefono_celu => "Telefono Celu",
        :email => "Email",
        :direccion => "Direccion",
        :ciudad => "Ciudad",
        :cod_postal => "Cod Postal",
        :provincia => "Provincia",
        :otro => "Otro",
        :agrente => nil
      ),
      stub_model(DatoContacto,
        :telefono_casa => "Telefono Casa",
        :telefono_celu => "Telefono Celu",
        :email => "Email",
        :direccion => "Direccion",
        :ciudad => "Ciudad",
        :cod_postal => "Cod Postal",
        :provincia => "Provincia",
        :otro => "Otro",
        :agrente => nil
      )
    ])
  end

  it "renders a list of dato_contactos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Telefono Casa".to_s, :count => 2
    assert_select "tr>td", :text => "Telefono Celu".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Direccion".to_s, :count => 2
    assert_select "tr>td", :text => "Ciudad".to_s, :count => 2
    assert_select "tr>td", :text => "Cod Postal".to_s, :count => 2
    assert_select "tr>td", :text => "Provincia".to_s, :count => 2
    assert_select "tr>td", :text => "Otro".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
