require 'spec_helper'

describe "familiars/edit" do
  before(:each) do
    @familiar = assign(:familiar, stub_model(Familiar,
      :relacion => "MyString",
      :cuil => "MyString",
      :nombre => "MyString",
      :apellido => "MyString",
      :lugar_nac => "MyString",
      :agrente => nil
    ))
  end

  it "renders the edit familiar form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", familiar_path(@familiar), "post" do
      assert_select "input#familiar_relacion[name=?]", "familiar[relacion]"
      assert_select "input#familiar_cuil[name=?]", "familiar[cuil]"
      assert_select "input#familiar_nombre[name=?]", "familiar[nombre]"
      assert_select "input#familiar_apellido[name=?]", "familiar[apellido]"
      assert_select "input#familiar_lugar_nac[name=?]", "familiar[lugar_nac]"
      assert_select "input#familiar_agrente[name=?]", "familiar[agrente]"
    end
  end
end
