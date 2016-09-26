require "test_helper"

class ParserCsvTest < ActiveSupport::TestCase

  def setup
    @parser ||= ParserCsv.new
    @file_csv ||= Rails.root + "config/prueba_csv.csv"
  end

  test 'debe responder a parsear' do
    @parser.must_respond_to :parsear
  end

  test 'obtener archivo csv' do
    csv = @parser.parsear(@file_csv)
    csv.must_be_instance_of(CSV::Table)
  end

  test 'verificar que el csv esta con los encabezados' do
    csv = @parser.parsear(@file_csv)
    csv.headers.wont_be_empty
  end

  test 'verificar los encabezados' do
    csv = @parser.parsear(@file_csv)
    csv.headers.must_include "Nombre"
  end

  test 'verificar los valores' do
    csv = @parser.parsear(@file_csv)
    csv.first['Nombre'].must_equal "Diego"
  end

end
