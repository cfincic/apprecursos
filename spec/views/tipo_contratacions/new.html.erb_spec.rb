require 'spec_helper'

describe "tipo_contrataciones/new" do
  before(:each) do
    assign(:tipo_contratacion, stub_model(TipoContratacion,
      :descripcion => "MyString"
    ).as_new_record)
  end

  it "renders new tipo_contratacion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tipo_contrataciones_path, "post" do
      assert_select "input#tipo_contratacion_descripcion[name=?]", "tipo_contratacion[descripcion]"
    end
  end
end
