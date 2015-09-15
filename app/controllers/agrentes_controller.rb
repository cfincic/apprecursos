class AgrentesController < ApplicationController
  before_action :set_agrente, only: [:show, :edit, :update, :destroy]

  # GET /agrentes
  # GET /agrentes.json
  def index
    @agrentes = Agrente.all
  end

  # GET /agrentes/1
  # GET /agrentes/1.json
  def show
  end

  # GET /agrentes/new
  def new
    @agrente = Agrente.new
    @tipo_documentos = TipoDocumento.all
  end

  # GET /agrentes/1/edit
  def edit
    @tipo_documentos = TipoDocumento.all
  end

  # POST /agrentes
  # POST /agrentes.json
  def create
    @agrente = Agrente.new(agrente_params)
    #@tddp = TipoDocumento.find_by_id(params[:tdp][:tipo_documento_id])

    respond_to do |format|
      if @agrente.save
        format.html { redirect_to @agrente, notice: 'Bien ahi! Creaste un Agente.' }
        format.json { render :show, status: :created, location: @agrente }
      else
        format.html { render :new }
        format.json { render json: @agrente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agrentes/1
  # PATCH/PUT /agrentes/1.json
  def update
    respond_to do |format|
      if @agrente.update(agrente_params)
        format.html { redirect_to @agrente, notice: 'Agrente was successfully updated.' }
        format.json { render :show, status: :ok, location: @agrente }
      else
        format.html { render :edit }
        format.json { render json: @agrente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agrentes/1
  # DELETE /agrentes/1.json
  def destroy
    @agrente.destroy
    respond_to do |format|
      format.html { redirect_to agrentes_url, notice: 'Agrente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agrente
      @agrente = Agrente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agrente_params
      params.require(:agrente).permit(:cuil, :nombre, :apellido, :num_legajo, :tipo_documento_id, :numero_doc, :fecha_nac, :lugar_nac, :nacionalidad, :estado_civil, :es_discapacitado, :expira_certificado, :telefono_casa, :telefono_celu, :email, :direccion, :ciudad, :cod_postal, :provincia, :otro)
    end
end
