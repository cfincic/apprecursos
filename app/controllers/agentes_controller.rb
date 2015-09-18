class AgentesController < ApplicationController
  before_action :set_agente, only: [:show, :edit, :update, :destroy]

  # GET /agentes
  # GET /agentes.json
  def index
    @agentes = Agente.all
  end

  # GET /agentes/1
  # GET /agentes/1.json
  def show
  end

  # GET /agentes/new
  def new
    @agente= Agente.new
    @tipo_documentos = TipoDocumento.all
    @provincias = Provincia.order(:detalle)
    @localidades = Localidad.order(:detalle)
  end

  # GET /agentes/1/edit
  def edit
    @tipo_documentos = TipoDocumento.all
    @provincias = Provincia.order(:detalle)
    @localidades = Localidad.order(:detalle)
  end

  # POST /agentes
  # POST /agentes.json
  def create
    @agente = Agente.new(agente_params)

    respond_to do |format|
      if@agente.save
        format.html { redirect_to @agente, notice: 'Bien ahi! Creaste n Agente.' }
        format.json { render :show, status: :created, locatin: @agente }
      else
        format.html { render :new }
        format.json { render json: @agente.errors, status: :unprocessble_entity }
      end
    end
  end

  # PATCH/PUT /agentes/1
  # PATCH/PUT /agentes/1.json
  def update
    respond_to do |format|
      if @agente.update(agente_params)
        format.html { redirect_to @agente, notice: 'Agente was successfull updated.' }
        format.json { render :show, status: :ok, locatin: @agente }
      else
        format.html { render :edit }
        format.json { render json: @agente.errors, status: :unprocessble_entity }
      end
    end
  end

  # DELETE /agentes/1
  # DELETE /agentes/1.json
  def destroy
    @agente.destroy
    respond_to do |format|
      format.html { redirect_to agentes_url, notice: 'Agente was successfully estroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agente
      @agente = Agente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agente_params
      params.require(:agente).permit(:cuil, :nombre, :apellido, :num_legajo, :tipo_documento_id, :numero_doc, :fecha_nac, :lugar_nac, :nacionalidad, :estado_civil, :es_discapacitado, :expira_certificado, :telefono_casa, :telefono_celu, :email, :direccion, :ciudad, :cod_postal, :provncia, :otro)
    end
end
