require 'spec_helper'

describe "hijos/edit" do
  before(:each) do
    @hijo = assign(:hijo, stub_model(Hijo,
      :agente => nil,
      :nombre => "MyString",
      :apellido => "MyString",
      :tipo_doc1 => "MyString",
      :num_doc1 => "MyString",
      :tipo_doc2 => "MyString",
      :num_doc2 => "MyString"
    ))
  end

  it "renders the edit hijo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", hijo_path(@hijo), "post" do
      assert_select "input#hijo_agente[name=?]", "hijo[agente]"
      assert_select "input#hijo_nombre[name=?]", "hijo[nombre]"
      assert_select "input#hijo_apellido[name=?]", "hijo[apellido]"
      assert_select "input#hijo_tipo_doc1[name=?]", "hijo[tipo_doc1]"
      assert_select "input#hijo_num_doc1[name=?]", "hijo[num_doc1]"
      assert_select "input#hijo_tipo_doc2[name=?]", "hijo[tipo_doc2]"
      assert_select "input#hijo_num_doc2[name=?]", "hijo[num_doc2]"
    end
  end
end
