require 'spec_helper'

describe "familiars/new" do
  before(:each) do
    assign(:familiar, stub_model(Familiar,
      :relacion => "MyString",
      :cuil => "MyString",
      :nombre => "MyString",
      :apellido => "MyString",
      :lugar_nac => "MyString",
      :agrente => nil
    ).as_new_record)
  end

  it "renders new familiar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", familiars_path, "post" do
      assert_select "input#familiar_relacion[name=?]", "familiar[relacion]"
      assert_select "input#familiar_cuil[name=?]", "familiar[cuil]"
      assert_select "input#familiar_nombre[name=?]", "familiar[nombre]"
      assert_select "input#familiar_apellido[name=?]", "familiar[apellido]"
      assert_select "input#familiar_lugar_nac[name=?]", "familiar[lugar_nac]"
      assert_select "input#familiar_agrente[name=?]", "familiar[agrente]"
    end
  end
end
