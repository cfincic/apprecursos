class CreateDatoLaborals < ActiveRecord::Migration
  def change
    create_table :dato_laborals do |t|
      t.references :agente, index: true
      t.references :sede, index: true      
      t.references :acto_administrativo, index: true      
      t.references :agrupamiento, index: true  
      t.references :tramo, index: true  
      t.integer :interno
      t.datetime :fecha_ingreso
      t.datetime :fecha_acto      
      t.datetime :fecha_apto_fisico           
      t.datetime :fecha_curriculum  
      t.string :nivel
      t.string :grado
      t.string :funcion
      t.string :direccion_laboral
      t.string :area
      t.text :telefono
      t.text :interno      
      t.string :depende_direccion
      t.text :jefe_directo
      t.decimal :sueldo_bruto
      t.decimal :sueldo_neto
      t.integer :cant_personas_acargo
      t.boolean :presento_titulo
      t.string :ultimo_nivel_estudio

      t.timestamps
    end
  end
end
