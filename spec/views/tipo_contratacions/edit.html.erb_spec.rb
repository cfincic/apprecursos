require 'spec_helper'

describe "tipo_contrataciones/edit" do
  before(:each) do
    @tipo_contratacion = assign(:tipo_contratacion, stub_model(TipoContratacion,
      :descripcion => "MyString"
    ))
  end

  it "renders the edit tipo_contratacion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tipo_contratacion_path(@tipo_contratacion), "post" do
      assert_select "input#tipo_contratacion_descripcion[name=?]", "tipo_contratacion[descripcion]"
    end
  end
end
