require 'spec_helper'

describe "areas/new" do
  before(:each) do
    assign(:area, stub_model(Area,
      :descripcion => "MyString",
      :jefe => "MyString",
      :esdire => "",
      :madre => ""
    ).as_new_record)
  end

  it "renders new area form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", areas_path, "post" do
      assert_select "input#area_descripcion[name=?]", "area[descripcion]"
      assert_select "input#area_jefe[name=?]", "area[jefe]"
      assert_select "input#area_esdire[name=?]", "area[esdire]"
      assert_select "input#area_madre[name=?]", "area[madre]"
    end
  end
end
