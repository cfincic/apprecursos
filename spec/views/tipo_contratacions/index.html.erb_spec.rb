require 'spec_helper'

describe "tipo_contrataciones/index" do
  before(:each) do
    assign(:tipo_contrataciones, [
      stub_model(TipoContratacion,
        :descripcion => "Descripcion"
      ),
      stub_model(TipoContratacion,
        :descripcion => "Descripcion"
      )
    ])
  end

  it "renders a list of tipo_contrataciones" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
  end
end
