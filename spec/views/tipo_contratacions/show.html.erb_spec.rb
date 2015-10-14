require 'spec_helper'

describe "tipo_contrataciones/show" do
  before(:each) do
    @tipo_contratacion = assign(:tipo_contratacion, stub_model(TipoContratacion,
      :descripcion => "Descripcion"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Descripcion/)
  end
end
