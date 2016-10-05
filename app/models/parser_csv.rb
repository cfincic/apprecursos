require 'csv'

class ParserCsv

  def parsear(file_csv, separador)
    raise ArgumentError, 'No hay archivo csv para parsear' if file_csv.blank?
    raise ArgumentError, 'No hay separador para parsear' if separador.blank?
    CSV.read(file_csv, headers: true, col_sep: separador, encoding:'iso-8859-1:utf-8')
  end

end
