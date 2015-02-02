require 'spec_helper'

describe "dato_contactos/edit" do
  before(:each) do
    @dato_contacto = assign(:dato_contacto, stub_model(DatoContacto,
      :telefono_casa => "MyString",
      :telefono_celu => "MyString",
      :email => "MyString",
      :direccion => "MyString",
      :ciudad => "MyString",
      :cod_postal => "MyString",
      :provincia => "MyString",
      :otro => "MyString",
      :agrente => nil
    ))
  end

  it "renders the edit dato_contacto form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dato_contacto_path(@dato_contacto), "post" do
      assert_select "input#dato_contacto_telefono_casa[name=?]", "dato_contacto[telefono_casa]"
      assert_select "input#dato_contacto_telefono_celu[name=?]", "dato_contacto[telefono_celu]"
      assert_select "input#dato_contacto_email[name=?]", "dato_contacto[email]"
      assert_select "input#dato_contacto_direccion[name=?]", "dato_contacto[direccion]"
      assert_select "input#dato_contacto_ciudad[name=?]", "dato_contacto[ciudad]"
      assert_select "input#dato_contacto_cod_postal[name=?]", "dato_contacto[cod_postal]"
      assert_select "input#dato_contacto_provincia[name=?]", "dato_contacto[provincia]"
      assert_select "input#dato_contacto_otro[name=?]", "dato_contacto[otro]"
      assert_select "input#dato_contacto_agrente[name=?]", "dato_contacto[agrente]"
    end
  end
end
