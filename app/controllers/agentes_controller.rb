#encoding: utf-8
class AgentesController < ApplicationController
  before_action :set_agente, only: [:show, :edit, :update, :destroy]

 #autocomplete :agente, :nombre , :full => true, :extra_data => [:apellido], :display_value => :traer_nombre_apellido
  def autocomplete_agente_apellido
      agente_activo = 1
    respond_to do |format|
      @agentes = Agente.where("agentes.estado_agente_id = ? AND agentes.apellido ILIKE ?", agente_activo, "%#{params[:term]}%")
      render :json => @agentes.map { |agente| {:id => agente.id, :value => agente.apellido + " "+ agente.nombre } }  
      format.js { } 
    end
  end    

  # GET /agentes
  # GET /agentes.json
  def index
    @agentes = Agente.where("estado_agente_id = ?", 1).order(:apellido)
  end

  # GET /agentes/1
  # GET /agentes/1.json
  def show
  end

  # GET /agentes/new
  def new
    @agente = Agente.new
    cargar_datos_estaticos
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
    @agente.estado_agente_id = 1

    respond_to do |format|
      if@agente.save
        format.html { redirect_to new_agente_dato_laboral_path(@agente), notice: 'El agente fué creado exitosamente.' }
        format.json { render :show, status: :created, locatin: @agente }
      else
        cargar_datos_estaticos
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
        format.html { redirect_to @agente, notice: 'El agente fué actualizado exitosamente.' }
        format.json { render :show, status: :ok, locatin: @agente }
      else
        cargar_datos_estaticos
        format.html { render :edit }
        format.json { render json: @agente.errors, status: :unprocessble_entity }
      end
    end
  end

  # DELETE /agentes/1
  # DELETE /agentes/1.json
  # def destroy
  #   @agente.destroy
  #   respond_to do |format|
  #     format.html { redirect_to agentes_url, notice: 'El agente fué eliminado exitosamente.' }
  #     format.json { head :no_content }
  #   end
  # end

  def dar_de_baja
    @agente = Agente.find(params[:agente_id])
    @agente.update(estado_agente_id: 2)
    respond_to do |format|
      format.html { redirect_to agentes_url, notice: 'El agente fué dado de baja exitosamente.' }
      format.json { head :no_content }
    end
  end

  def ver_preview_agente
    @agente = Agente.find(params[:agente_id])
  end

  def traer_lista_de_agentes
    agente_id = params[:agente_id]

    @agentes = Agente.where("id = ?", agente_id)   

    respond_to do |format| 
      format.js { }
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agente
      @agente = Agente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agente_params
      params.require(:agente).permit(:cuil, :nombre, :apellido, :num_legajo, :tipo_documento_id, :numero_doc, :fecha_nac, :fecha_antecedentes_penales, :lugar_nac, :nacionalidad, :estado_civil, :es_discapacitado, :expira_certificado, :telefono_casa, :telefono_celu, :email, :direccion, :localidad_id, :cod_postal, :provincia_id, :email2, :foto)
    end

    def cargar_datos_estaticos
      @tipo_documentos = TipoDocumento.all
      @provincias = Provincia.order(:detalle)
      @localidades = Localidad.order(:detalle)
    end
end
