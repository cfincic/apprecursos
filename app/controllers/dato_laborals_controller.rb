class DatoLaboralsController < ApplicationController
  before_action :set_dato_laboral, only: [:show, :edit, :update, :destroy]

  # GET /dato_laborals
  # GET /dato_laborals.json
  def index
    @agente = Agrente.find(params[:agrente_id])
    @dato_laboral = @agente.dato_laboral
  end

  # GET /dato_laborals/1
  # GET /dato_laborals/1.json
  def show
    
  end

  # GET /dato_laborals/new
  def new    
    @dato_laboral = DatoLaboral.new
    @agente = Agrente.find(params[:agrente_id])
  end

  # GET /dato_laborals/1/edit
  def edit
    @agente = Agrente.find(params[:agrente_id])
    @datto_laboral = DatoLaboral.find(params[:id])
  end

  # POST /dato_laborals
  # POST /dato_laborals.json
  def create
    # @agrente = Agrente.find(params[:agrente_id])
    @dato_laboral = DatoLaboral.new(dato_laboral_params)

    respond_to do |format|
      if @dato_laboral.save
        format.html { redirect_to agrente_dato_laborals_path, notice: 'Dato laboral was successfully created.' }
        format.json { render :show, status: :created, location: @dato_laboral }
      else
        format.html { render :new }
        format.json { render json: @dato_laboral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dato_laborals/1
  # PATCH/PUT /dato_laborals/1.json
  def update
    respond_to do |format|
      if @dato_laboral.update(dato_laboral_params)
        format.html { redirect_to agrente_dato_laborals_path, notice: 'Dato laboral was successfully updated.' }
        format.json { render :show, status: :ok, location: @dato_laboral }
      else
        format.html { render :edit }
        format.json { render json: @dato_laboral.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dato_laborals/1
  # DELETE /dato_laborals/1.json
  def destroy
    @dato_laboral.destroy
    respond_to do |format|
      format.html { redirect_to agrente_dato_laborals_path, notice: 'Dato laboral was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dato_laboral
      @dato_laboral = DatoLaboral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dato_laboral_params
      params.require(:dato_laboral).permit(:agrente_id, :num_legajo, :sede, :interno, :fecha_ingreso, :situ_revista, :agrupamiento, :nivel, :grado, :tramo, :cargo, :obj_cargo, :tareas_cargo, :depende_direccion, :jefe_directo, :sueldo_bruto, :sueldo_neto, :cant_personas_acargo)
    end
end
