require 'spec_helper'

describe "familiars/index" do
  before(:each) do
    assign(:familiars, [
      stub_model(Familiar,
        :relacion => "Relacion",
        :cuil => "Cuil",
        :nombre => "Nombre",
        :apellido => "Apellido",
        :lugar_nac => "Lugar Nac",
        :agrente => nil
      ),
      stub_model(Familiar,
        :relacion => "Relacion",
        :cuil => "Cuil",
        :nombre => "Nombre",
        :apellido => "Apellido",
        :lugar_nac => "Lugar Nac",
        :agrente => nil
      )
    ])
  end

  it "renders a list of familiars" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Relacion".to_s, :count => 2
    assert_select "tr>td", :text => "Cuil".to_s, :count => 2
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Apellido".to_s, :count => 2
    assert_select "tr>td", :text => "Lugar Nac".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
