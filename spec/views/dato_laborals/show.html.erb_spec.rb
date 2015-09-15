require 'spec_helper'

describe "dato_laborals/show" do
  before(:each) do
    @dato_laboral = assign(:dato_laboral, stub_model(DatoLaboral,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/Agrupamiento/)
    rendered.should match(/Nivel/)
    rendered.should match(/Grado/)
    rendered.should match(/Tramo/)
    rendered.should match(/Cargo/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Depende Direccion/)
    rendered.should match(/5/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
    rendered.should match(/6/)
  end
end
