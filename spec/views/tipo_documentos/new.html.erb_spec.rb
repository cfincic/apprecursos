require 'spec_helper'

describe "tipo_documentos/new" do
  before(:each) do
    assign(:tipo_documento, stub_model(TipoDocumento,
      :tipo => "MyString"
    ).as_new_record)
  end

  it "renders new tipo_documento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tipo_documentos_path, "post" do
      assert_select "input#tipo_documento_tipo[name=?]", "tipo_documento[tipo]"
    end
  end
end
