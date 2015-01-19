require 'spec_helper'

describe "tipo_documentos/index" do
  before(:each) do
    assign(:tipo_documentos, [
      stub_model(TipoDocumento,
        :tipo => "Tipo"
      ),
      stub_model(TipoDocumento,
        :tipo => "Tipo"
      )
    ])
  end

  it "renders a list of tipo_documentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Tipo".to_s, :count => 2
  end
end
