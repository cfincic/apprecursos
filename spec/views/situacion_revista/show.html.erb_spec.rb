require 'spec_helper'

describe "situacion_revista/show" do
  before(:each) do
    @situacion_revistum = assign(:situacion_revistum, stub_model(SituacionRevistum,
      :descripcion => "Descripcion"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Descripcion/)
  end
end
