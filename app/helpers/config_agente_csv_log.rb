module ConfigAgenteCsvLog

  def ruta_log
    config = YAML.load_file(Rails.root.join('config/importador_csv_log.yml'))
    config['ruta']['agente']
  end

  def log_exist?
    File.exist?(ruta_log)
  end

  def obtener_log
    File.read ruta_log if log_exist?
  end

  def log_html(log)
    log.to_s.gsub(/\n/, '<br/>').html_safe
  end

end
