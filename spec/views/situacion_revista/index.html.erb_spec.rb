require 'spec_helper'

describe "situacion_revista/index" do
  before(:each) do
    assign(:situacion_revista, [
      stub_model(SituacionRevistum,
        :descripcion => "Descripcion"
      ),
      stub_model(SituacionRevistum,
        :descripcion => "Descripcion"
      )
    ])
  end

  it "renders a list of situacion_revista" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
  end
end
