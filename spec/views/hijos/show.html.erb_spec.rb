require 'spec_helper'

describe "hijos/show" do
  before(:each) do
    @hijo = assign(:hijo, stub_model(Hijo,
      :agente => nil,
      :nombre => "Nombre",
      :apellido => "Apellido",
      :tipo_doc1 => "Tipo Doc1",
      :num_doc1 => "Num Doc1",
      :tipo_doc2 => "Tipo Doc2",
      :num_doc2 => "Num Doc2"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Nombre/)
    rendered.should match(/Apellido/)
    rendered.should match(/Tipo Doc1/)
    rendered.should match(/Num Doc1/)
    rendered.should match(/Tipo Doc2/)
    rendered.should match(/Num Doc2/)
  end
end
