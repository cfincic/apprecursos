#encoding: utf-8
class FamiliarsController < ApplicationController
  before_action :set_familiar, only: [:show, :edit, :update, :destroy]

  # GET /familiars
  # GET /familiars.json
  def index
    
    @agente = Agente.find(params[:agente_id])
    @familiars = @agente.familiars
  end

  # GET /familiars/1
  # GET /familiars/1.json
  def show
  end

  # GET /familiars/new
  def new
    @familiar = Familiar.new
    @agente = Agente.find(params[:agente_id])
  end

  # GET /familiars/1/edit
  def edit
    @agente = Agente.find(params[:agente_id])
    @familiar = Familiar.find(params[:id])
  end

  # POST /familiars
  # POST /familiars.json
  def create
    #@familiar = Familiar.new(familiar_params)
    @agente = Agente.find(params[:agente_id])
    @familiar = @agente.familiars.build(familiar_params)
    respond_to do |format|
      if @familiar.save
        format.html { redirect_to agente_familiars_path(@agente), notice: 'El familiar fué creado exitosamente.' }
        format.json { render :show, status: :created, location: @familiar }
      else
        format.html { render :new }
        format.json { render json: @familiar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /familiars/1
  # PATCH/PUT /familiars/1.json
  def update
    respond_to do |format|
      if @familiar.update(familiar_params)
        @agente = Agente.find(params[:agente_id])
        format.html { redirect_to agente_familiars_path(@agente), notice: 'El familiar fué actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @familiar }
      else
        format.html { render :edit }
        format.json { render json: @familiar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familiars/1
  # DELETE /familiars/1.json
  def destroy
    @familiar.destroy
    respond_to do |format|
      format.html { redirect_to agente_familiars_path(@familiar.agente), notice: 'El familiar fué eliminado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_familiar
      @familiar = Familiar.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def familiar_params
      params.require(:familiar).permit(:relacion, :cuil, :nombre, :apellido, :fecha_nac, :lugar_nac, :agente_id)
    end
end
