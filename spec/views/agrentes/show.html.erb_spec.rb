require 'spec_helper'

describe "agrentes/show" do
  before(:each) do
    @agrente = assign(:agrente, stub_model(Agrente,
      :cuil => "Cuil",
      :nombre => "Nombre",
      :apellido => "Apellido",
      :TipoDocumento => nil,
      :numero_doc => "Numero Doc",
      :lugar_nac => "Lugar Nac",
      :nacionalidad => "Nacionalidad",
      :estado_civil => "Estado Civil",
      :es_discapacitado => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cuil/)
    rendered.should match(/Nombre/)
    rendered.should match(/Apellido/)
    rendered.should match(//)
    rendered.should match(/Numero Doc/)
    rendered.should match(/Lugar Nac/)
    rendered.should match(/Nacionalidad/)
    rendered.should match(/Estado Civil/)
    rendered.should match(//)
  end
end
