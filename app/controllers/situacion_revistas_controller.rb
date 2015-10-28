#encoding: utf-8
class SituacionRevistasController < ApplicationController
  before_action :set_situacion_revista, only: [:show, :edit, :update, :destroy]

  # GET /situacion_revista
  # GET /situacion_revista.json
  def index
    @situacion_revista = SituacionRevista.all
  end

  # GET /situacion_revista/1
  # GET /situacion_revista/1.json
  def show
  end

  # GET /situacion_revista/new
  def new
    @situacion_revista = SituacionRevista.new
  end

  # GET /situacion_revista/1/edit
  def edit
  end

  # POST /situacion_revista
  # POST /situacion_revista.json
  def create
    @situacion_revista = SituacionRevista.new(situacion_revista_params)

    respond_to do |format|
      if @situacion_revista.save
        format.html { redirect_to @situacion_revista, notice: 'La situacion de revista fué creada exitosamente.' }
        format.json { render :show, status: :created, location: @situacion_revista }
      else
        format.html { render :new }
        format.json { render json: @situacion_revista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /situacion_revista/1
  # PATCH/PUT /situacion_revista/1.json
  def update
    respond_to do |format|
      if @situacion_revista.update(situacion_revista_params)
        format.html { redirect_to @situacion_revista, notice: 'La situacion de revista fué actualizada exitosamente.' }
        format.json { render :show, status: :ok, location: @situacion_revista }
      else
        format.html { render :edit }
        format.json { render json: @situacion_revista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /situacion_revista/1
  # DELETE /situacion_revista/1.json
  def destroy
    @situacion_revista.destroy
    respond_to do |format|
      format.html { redirect_to situacion_revista_url, notice: 'La situacion de revista fué eliminada exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_situacion_revistum
      @situacion_revista = SituacionRevista.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def situacion_revistum_params
      params.require(:situacion_revista).permit(:descripcion)
    end
end
