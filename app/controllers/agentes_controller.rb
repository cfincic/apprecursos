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
    @agente = Agente.new
  end

  # GET /agentes/1/edit
  def edit
  end

  # POST /agentes
  # POST /agentes.json
  def create
    @agente = Agente.new(agente_params)

    respond_to do |format|
      if @agente.save
        format.html { redirect_to @agente, notice: 'El Agente ha sido creado.' }
        format.json { render :show, status: :created, location: @agente }
      else
        format.html { render :new }
        format.json { render json: @agente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agentes/1
  # PATCH/PUT /agentes/1.json
  def update
    respond_to do |format|
      if @agente.update(agente_params)
        format.html { redirect_to @agente, notice: 'El Agente ha sido actualizado.' }
        format.json { render :show, status: :ok, location: @agente }
      else
        format.html { render :edit }
        format.json { render json: @agente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agentes/1
  # DELETE /agentes/1.json
  def destroy
    @agente.destroy
    respond_to do |format|
      format.html { redirect_to agentes_url, notice: 'El Agente ha sido borrado.' }
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
      params.require(:agente).permit(:legajo, :nombre, :apellido)
    end
end
