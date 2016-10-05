require "test_helper"

class ParserCsvTest < ActiveSupport::TestCase

  def setup
    @parser ||= ParserCsv.new
    @file_csv ||= Rails.root + "config/prueba_csv.csv"
  end

  test 'debe responder a parsear' do
    @parser.must_respond_to :parsear
  end

  test 'debe verificar que el archivo csv exista' do
    e = proc{ @parser.parsear(nil, ',') }.must_raise ArgumentError
    e.message.must_equal('No hay archivo csv para parsear')
  end

  test 'debe verificar que el separador exista' do
    e = proc{ @parser.parsear(@file_csv, nil) }.must_raise ArgumentError
    e.message.must_equal('No hay separador para parsear')
  end

  test 'obtener archivo csv' do
    parsear_csv.must_be_instance_of(CSV::Table)
  end

  test 'verificar que el csv esta con los encabezados' do
    parsear_csv.headers.wont_be_empty
  end

  test 'verificar los encabezados' do
    parsear_csv.headers.must_include "Nombre"
  end

  test 'verificar los valores' do
    parsear_csv.first['Nombre'].must_equal "Diego"
  end

  test 'verificar los valores con otro separador' do
    file_csv = Rails.root + "config/prueba_csv_punto_y_coma.csv"
    @parser.parsear(file_csv, ';').first['Nombre'].must_equal "Diego"
  end

  def parsear_csv
    @parser.parsear(@file_csv, ',')
  end

end
