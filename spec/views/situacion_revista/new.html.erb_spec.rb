require 'spec_helper'

describe "situacion_revista/new" do
  before(:each) do
    assign(:situacion_revistum, stub_model(SituacionRevistum,
      :descripcion => "MyString"
    ).as_new_record)
  end

  it "renders new situacion_revistum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", situacion_revista_path, "post" do
      assert_select "input#situacion_revistum_descripcion[name=?]", "situacion_revistum[descripcion]"
    end
  end
end
