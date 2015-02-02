require 'spec_helper'

describe "sedes/new" do
  before(:each) do
    assign(:sede, stub_model(Sede,
      :descripcion => "MyString",
      :direccion => "MyString",
      :telefono1 => "MyString",
      :telefono2 => "MyString"
    ).as_new_record)
  end

  it "renders new sede form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sedes_path, "post" do
      assert_select "input#sede_descripcion[name=?]", "sede[descripcion]"
      assert_select "input#sede_direccion[name=?]", "sede[direccion]"
      assert_select "input#sede_telefono1[name=?]", "sede[telefono1]"
      assert_select "input#sede_telefono2[name=?]", "sede[telefono2]"
    end
  end
end
