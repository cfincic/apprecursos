require 'spec_helper'

describe "agrentes/index" do
  before(:each) do
    assign(:agrentes, [
      stub_model(Agrente,
        :cuil => "Cuil",
        :nombre => "Nombre",
        :apellido => "Apellido",
        :TipoDocumento => nil,
        :numero_doc => "Numero Doc",
        :lugar_nac => "Lugar Nac",
        :nacionalidad => "Nacionalidad",
        :estado_civil => "Estado Civil",
        :es_discapacitado => ""
      ),
      stub_model(Agrente,
        :cuil => "Cuil",
        :nombre => "Nombre",
        :apellido => "Apellido",
        :TipoDocumento => nil,
        :numero_doc => "Numero Doc",
        :lugar_nac => "Lugar Nac",
        :nacionalidad => "Nacionalidad",
        :estado_civil => "Estado Civil",
        :es_discapacitado => ""
      )
    ])
  end

  it "renders a list of agrentes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cuil".to_s, :count => 2
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Apellido".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Numero Doc".to_s, :count => 2
    assert_select "tr>td", :text => "Lugar Nac".to_s, :count => 2
    assert_select "tr>td", :text => "Nacionalidad".to_s, :count => 2
    assert_select "tr>td", :text => "Estado Civil".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
