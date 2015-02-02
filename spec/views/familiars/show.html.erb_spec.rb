require 'spec_helper'

describe "familiars/show" do
  before(:each) do
    @familiar = assign(:familiar, stub_model(Familiar,
      :relacion => "Relacion",
      :cuil => "Cuil",
      :nombre => "Nombre",
      :apellido => "Apellido",
      :lugar_nac => "Lugar Nac",
      :agrente => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Relacion/)
    rendered.should match(/Cuil/)
    rendered.should match(/Nombre/)
    rendered.should match(/Apellido/)
    rendered.should match(/Lugar Nac/)
    rendered.should match(//)
  end
end
