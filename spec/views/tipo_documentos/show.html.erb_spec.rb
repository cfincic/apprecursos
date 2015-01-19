require 'spec_helper'

describe "tipo_documentos/show" do
  before(:each) do
    @tipo_documento = assign(:tipo_documento, stub_model(TipoDocumento,
      :tipo => "Tipo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Tipo/)
  end
end
