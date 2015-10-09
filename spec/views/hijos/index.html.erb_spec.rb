require 'spec_helper'

describe "hijos/index" do
  before(:each) do
    assign(:hijos, [
      stub_model(Hijo,
        :agente => nil,
        :nombre => "Nombre",
        :apellido => "Apellido",
        :tipo_doc1 => "Tipo Doc1",
        :num_doc1 => "Num Doc1",
        :tipo_doc2 => "Tipo Doc2",
        :num_doc2 => "Num Doc2"
      ),
      stub_model(Hijo,
        :agente => nil,
        :nombre => "Nombre",
        :apellido => "Apellido",
        :tipo_doc1 => "Tipo Doc1",
        :num_doc1 => "Num Doc1",
        :tipo_doc2 => "Tipo Doc2",
        :num_doc2 => "Num Doc2"
      )
    ])
  end

  it "renders a list of hijos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Apellido".to_s, :count => 2
    assert_select "tr>td", :text => "Tipo Doc1".to_s, :count => 2
    assert_select "tr>td", :text => "Num Doc1".to_s, :count => 2
    assert_select "tr>td", :text => "Tipo Doc2".to_s, :count => 2
    assert_select "tr>td", :text => "Num Doc2".to_s, :count => 2
  end
end
