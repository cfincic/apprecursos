require 'spec_helper'

describe "dato_laborals/new" do
  before(:each) do
    assign(:dato_laboral, stub_model(DatoLaboral,
      :agrente => nil,
      :num_legajo => 1,
      :sede => 1,
      :interno => 1,
      :situ_revista => 1,
      :agrupamiento => "MyString",
      :nivel => "MyString",
      :grado => "MyString",
      :tramo => "MyString",
      :cargo => "MyString",
      :obj_cargo => "MyText",
      :tareas_cargo => "MyText",
      :depende_direccion => "MyString",
      :jefe_directo => 1,
      :sueldo_bruto => "9.99",
      :sueldo_neto => "9.99",
      :cant_personas_acargo => 1
    ).as_new_record)
  end

  it "renders new dato_laboral form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dato_laborals_path, "post" do
      assert_select "input#dato_laboral_agrente[name=?]", "dato_laboral[agrente]"
      assert_select "input#dato_laboral_num_legajo[name=?]", "dato_laboral[num_legajo]"
      assert_select "input#dato_laboral_sede[name=?]", "dato_laboral[sede]"
      assert_select "input#dato_laboral_interno[name=?]", "dato_laboral[interno]"
      assert_select "input#dato_laboral_situ_revista[name=?]", "dato_laboral[situ_revista]"
      assert_select "input#dato_laboral_agrupamiento[name=?]", "dato_laboral[agrupamiento]"
      assert_select "input#dato_laboral_nivel[name=?]", "dato_laboral[nivel]"
      assert_select "input#dato_laboral_grado[name=?]", "dato_laboral[grado]"
      assert_select "input#dato_laboral_tramo[name=?]", "dato_laboral[tramo]"
      assert_select "input#dato_laboral_cargo[name=?]", "dato_laboral[cargo]"
      assert_select "textarea#dato_laboral_obj_cargo[name=?]", "dato_laboral[obj_cargo]"
      assert_select "textarea#dato_laboral_tareas_cargo[name=?]", "dato_laboral[tareas_cargo]"
      assert_select "input#dato_laboral_depende_direccion[name=?]", "dato_laboral[depende_direccion]"
      assert_select "input#dato_laboral_jefe_directo[name=?]", "dato_laboral[jefe_directo]"
      assert_select "input#dato_laboral_sueldo_bruto[name=?]", "dato_laboral[sueldo_bruto]"
      assert_select "input#dato_laboral_sueldo_neto[name=?]", "dato_laboral[sueldo_neto]"
      assert_select "input#dato_laboral_cant_personas_acargo[name=?]", "dato_laboral[cant_personas_acargo]"
    end
  end
end
