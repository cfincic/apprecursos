#encoding: utf-8
class HijosController < ApplicationController
  before_action :set_hijo, only: [:show, :edit, :update, :destroy]

  # GET /hijos
  # GET /hijos.json
  def index
    
    @agente = Agente.find(params[:agente_id])
    @hijos = @agente.hijos
  end

  # GET /hijos/1
  # GET /hijos/1.json
  def show

  end

  # GET /hijos/new
  def new
    @tipo_documentos =  TipoDocumento.all
    @hijo = Hijo.new
    @agente = Agente.find(params[:agente_id])
  end

  # GET /hijos/1/edit
  def edit
    @agente = Agente.find(params[:agente_id])
    @hijo = Hijo.find(params[:id])
    @tipo_documentos =  TipoDocumento.all
  end

  # POST /hijos
  # POST /hijos.json
  def create
    @agente = Agente.find(params[:agente_id])
    @hijo = @agente.hijos.build(hijo_params)

    respond_to do |format|
      if @hijo.save
        format.html { redirect_to agente_hijos_path(@agente), notice: 'El hijo fué creado exitosamente.' }
        format.json { render :show, status: :created, location: @hijo }
      else
        format.html { render :new }
        format.json { render json: @hijo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hijos/1
  # PATCH/PUT /hijos/1.json
  def update
    respond_to do |format|
      if @hijo.update(hijo_params)
        format.html { redirect_to @hijo, notice: 'El hijo fué actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @hijo }
      else
        format.html { render :edit }
        format.json { render json: @hijo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hijos/1
  # DELETE /hijos/1.json
  def destroy
    @hijo.destroy
    respond_to do |format|
      format.html { redirect_to hijos_url, notice: 'El hijo fué eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hijo
      @hijo = Hijo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hijo_params
      params.require(:hijo).permit(:agente_id, :nombre, :apellido, :fecha_nac, :tipo_doc1_id, :num_doc1, :tipo_doc2_id, :num_doc2)
    end
end
