require 'spec_helper'

describe "situacion_revista/edit" do
  before(:each) do
    @situacion_revistum = assign(:situacion_revistum, stub_model(SituacionRevistum,
      :descripcion => "MyString"
    ))
  end

  it "renders the edit situacion_revistum form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", situacion_revistum_path(@situacion_revistum), "post" do
      assert_select "input#situacion_revistum_descripcion[name=?]", "situacion_revistum[descripcion]"
    end
  end
end
