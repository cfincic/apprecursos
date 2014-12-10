require 'spec_helper'

describe "agentes/edit" do
  before(:each) do
    @agente = assign(:agente, stub_model(Agente,
      :legajo => "",
      :nombre => "MyString",
      :apellido => "MyString"
    ))
  end

  it "renders the edit agente form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", agente_path(@agente), "post" do
      assert_select "input#agente_legajo[name=?]", "agente[legajo]"
      assert_select "input#agente_nombre[name=?]", "agente[nombre]"
      assert_select "input#agente_apellido[name=?]", "agente[apellido]"
    end
  end
end
