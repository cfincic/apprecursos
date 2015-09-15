require 'spec_helper'

describe "dato_laborals/index" do
  before(:each) do
    assign(:dato_laborals, [
      stub_model(DatoLaboral,
        :agrente => nil,
        :num_legajo => 1,
        :sede => 2,
        :interno => 3,
        :situ_revista => 4,
        :agrupamiento => "Agrupamiento",
        :nivel => "Nivel",
        :grado => "Grado",
        :tramo => "Tramo",
        :cargo => "Cargo",
        :obj_cargo => "MyText",
        :tareas_cargo => "MyText",
        :depende_direccion => "Depende Direccion",
        :jefe_directo => 5,
        :sueldo_bruto => "9.99",
        :sueldo_neto => "9.99",
        :cant_personas_acargo => 6
      ),
      stub_model(DatoLaboral,
        :agrente => nil,
        :num_legajo => 1,
        :sede => 2,
        :interno => 3,
        :situ_revista => 4,
        :agrupamiento => "Agrupamiento",
        :nivel => "Nivel",
        :grado => "Grado",
        :tramo => "Tramo",
        :cargo => "Cargo",
        :obj_cargo => "MyText",
        :tareas_cargo => "MyText",
        :depende_direccion => "Depende Direccion",
        :jefe_directo => 5,
        :sueldo_bruto => "9.99",
        :sueldo_neto => "9.99",
        :cant_personas_acargo => 6
      )
    ])
  end

  it "renders a list of dato_laborals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Agrupamiento".to_s, :count => 2
    assert_select "tr>td", :text => "Nivel".to_s, :count => 2
    assert_select "tr>td", :text => "Grado".to_s, :count => 2
    assert_select "tr>td", :text => "Tramo".to_s, :count => 2
    assert_select "tr>td", :text => "Cargo".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Depende Direccion".to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
  end
end
