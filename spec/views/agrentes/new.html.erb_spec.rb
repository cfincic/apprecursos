require 'spec_helper'

describe "agrentes/new" do
  before(:each) do
    assign(:agrente, stub_model(Agrente,
      :cuil => "MyString",
      :nombre => "MyString",
      :apellido => "MyString",
      :TipoDocumento => nil,
      :numero_doc => "MyString",
      :lugar_nac => "MyString",
      :nacionalidad => "MyString",
      :estado_civil => "MyString",
      :es_discapacitado => ""
    ).as_new_record)
  end

  it "renders new agrente form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", agrentes_path, "post" do
      assert_select "input#agrente_cuil[name=?]", "agrente[cuil]"
      assert_select "input#agrente_nombre[name=?]", "agrente[nombre]"
      assert_select "input#agrente_apellido[name=?]", "agrente[apellido]"
      assert_select "input#agrente_TipoDocumento[name=?]", "agrente[TipoDocumento]"
      assert_select "input#agrente_numero_doc[name=?]", "agrente[numero_doc]"
      assert_select "input#agrente_lugar_nac[name=?]", "agrente[lugar_nac]"
      assert_select "input#agrente_nacionalidad[name=?]", "agrente[nacionalidad]"
      assert_select "input#agrente_estado_civil[name=?]", "agrente[estado_civil]"
      assert_select "input#agrente_es_discapacitado[name=?]", "agrente[es_discapacitado]"
    end
  end
end
