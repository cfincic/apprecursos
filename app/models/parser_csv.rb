require 'csv'

class ParserCsv

  def parsear(file_csv)
    CSV.read(file_csv, headers: true)
  end

end
