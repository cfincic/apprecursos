require 'spec_helper'

describe "tipo_documentos/edit" do
  before(:each) do
    @tipo_documento = assign(:tipo_documento, stub_model(TipoDocumento,
      :tipo => "MyString"
    ))
  end

  it "renders the edit tipo_documento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tipo_documento_path(@tipo_documento), "post" do
      assert_select "input#tipo_documento_tipo[name=?]", "tipo_documento[tipo]"
    end
  end
end
