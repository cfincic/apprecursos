require 'spec_helper'

describe "sedes/edit" do
  before(:each) do
    @sede = assign(:sede, stub_model(Sede,
      :descripcion => "MyString",
      :direccion => "MyString",
      :telefono1 => "MyString",
      :telefono2 => "MyString"
    ))
  end

  it "renders the edit sede form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sede_path(@sede), "post" do
      assert_select "input#sede_descripcion[name=?]", "sede[descripcion]"
      assert_select "input#sede_direccion[name=?]", "sede[direccion]"
      assert_select "input#sede_telefono1[name=?]", "sede[telefono1]"
      assert_select "input#sede_telefono2[name=?]", "sede[telefono2]"
    end
  end
end
