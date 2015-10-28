#encoding: utf-8
class TipoContratacionesController < ApplicationController
  before_action :set_tipo_contratacion, only: [:show, :edit, :update, :destroy]

  # GET /tipo_contrataciones
  # GET /tipo_contrataciones.json
  def index
    @tipo_contrataciones = TipoContratacion.all
  end

  # GET /tipo_contrataciones/1
  # GET /tipo_contrataciones/1.json
  def show
  end

  # GET /tipo_contrataciones/new
  def new
    @tipo_contratacion = TipoContratacion.new
  end

  # GET /tipo_contrataciones/1/edit
  def edit
  end

  # POST /tipo_contrataciones
  # POST /tipo_contrataciones.json
  def create
    @tipo_contratacion = TipoContratacion.new(tipo_contratacion_params)

    respond_to do |format|
      if @tipo_contratacion.save
        format.html { redirect_to @tipo_contratacion, notice: 'El tipo de contratacion fué creado exitosamente.' }
        format.json { render :show, status: :created, location: @tipo_contratacion }
      else
        format.html { render :new }
        format.json { render json: @tipo_contratacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_contrataciones/1
  # PATCH/PUT /tipo_contrataciones/1.json
  def update
    respond_to do |format|
      if @tipo_contratacion.update(tipo_contratacion_params)
        format.html { redirect_to @tipo_contratacion, notice: 'El tipo de contratación fué actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @tipo_contratacion }
      else
        format.html { render :edit }
        format.json { render json: @tipo_contratacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_contrataciones/1
  # DELETE /tipo_contrataciones/1.json
  def destroy
    @tipo_contratacion.destroy
    respond_to do |format|
      format.html { redirect_to tipo_contrataciones_url, notice: 'El tipo de contratación fué eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_contratacion
      @tipo_contratacion = TipoContratacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_contratacion_params
      params.require(:tipo_contratacion).permit(:descripcion)
    end
end
