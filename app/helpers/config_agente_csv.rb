module ConfigAgenteCsv

  def obtener_config_agente_csv
    config = YAML.load_file(Rails.root.join('config/importador_csv.yml'))
    config['ruta']['agente']
  end

end
