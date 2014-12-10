require 'spec_helper'

describe "agentes/show" do
  before(:each) do
    @agente = assign(:agente, stub_model(Agente,
      :legajo => "",
      :nombre => "Nombre",
      :apellido => "Apellido"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Nombre/)
    rendered.should match(/Apellido/)
  end
end
