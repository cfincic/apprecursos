class AgentesCsvController < ApplicationController
  include ConfigAgenteCsv
  include ConfigAgenteCsvLog
  helper_method ConfigAgenteCsv.instance_methods
  helper_method ConfigAgenteCsvLog.instance_methods

  def index

  end

  def create
	ImportadorAgenteCsv.new(obtener_config_agente_csv, ruta_log).importar
    redirect_to agentes_csv_show_path
  end

  def show
    @log = obtener_log
  end

end
