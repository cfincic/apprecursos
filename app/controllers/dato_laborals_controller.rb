class DatoLaboralsController < ApplicationController
  before_action :set_dato_laboral, only: [:show, :edit, :update, :destroy]

  # GET /dato_laborals
  # GET /dato_laborals.json
  def index
    @agente = Agente.find(params[:agente_id])
    @dato_laboral = @agente.dato_laboral
  end

  # GET /dato_laborals/1
  # GET /dato_laborals/1.json
  def show
    
  end

  # GET /dato_laborals/new
  def new    
    @dato_laboral = DatoLaboral.new
    @dato_laboral.situacion_revistas.build
    @dato_laboral.build_periodo_de_contratacion
    @dato_laboral.agente_id = params[:agente_id]    
    @agente = Agente.find(params[:agente_id])
    asignar_datos_estaticos
  end

  # GET /dato_laborals/1/edit
  def edit    
    @agente = Agente.find(params[:agente_id])
    @dato_laboral = DatoLaboral.find(params[:id])
    @dato_laboral.situacion_revistas.build
    asignar_datos_estaticos    
  end

  # POST /dato_laborals
  # POST /dato_laborals.json
  def create
    @dato_laboral = DatoLaboral.new(dato_laboral_params)
    @agente = Agente.find(params[:agente_id])      

    respond_to do |format|
      if @dato_laboral.save
        format.html { redirect_to agente_path(@agente), notice: 'Los datos laborales fueron creados exitosamente.' }
        format.json { render :show, status: :created, location: @dato_laboral }
      else                        
        @dato_laboral.agente_id = params[:agente_id]    
        format.html { render :new }
        format.json { render json: @dato_laboral.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dato_laborals/1
  # PATCH/PUT /dato_laborals/1.json
  def update
    @agente = Agente.find(params[:agente_id])
    respond_to do |format|
      if @dato_laboral.update(dato_laboral_params)
        format.html { redirect_to agente_path(@agente), notice: 'Los datos laborales fueron actualizados exitosamente.' }
        format.json { render :show, status: :ok, location: @dato_laboral }
      else        
        asignar_datos_estaticos   
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
      format.html { redirect_to agente_dato_laborals_path, notice: 'Los datos laborales fueron eliminados exitosamente.' }
      format.json { head :no_content }
    end
  end

  def obtener_direccion_madre
      @area_datos = Area.new
      if !params[:area_id].blank?
        @area_seleccionada = Area.find(params[:area_id])
        @area_datos.jefe = @area_seleccionada.jefe
        @area_datos.descripcion = @area_seleccionada.descripcion

        while 1 do        
          if !@area_seleccionada.area.nil? && @area_seleccionada.area.esdire
            @area_datos.madre = @area_seleccionada.area.descripcion
            break
          end
        end
      end
      respond_to do | format |                                  
          format.json { render :json => @area_datos }        
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dato_laboral
      @dato_laboral = DatoLaboral.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dato_laboral_params
      params.require(:dato_laboral).permit(:agente_id, :acto_administrativo_id, :tramo_id, :agrupamiento_id, :num_legajo, :sede_id,
       :interno, :fecha_ingreso, :fecha_acto,  :funcion,:situ_revista, :nivel, :fecha_acto, :fecha_apto_fisico, :fecha_curriculum, 
       :grado, :cargo, :obj_cargo, :telefono, :tareas_cargo, :depende_direccion, :jefe_directo, :sueldo_bruto, :sueldo_neto, :cant_personas_acargo,
       :presento_titulo, :ultimo_nivel_estudio,  situacion_revistas_attributes: [ :id, :tipo_contratacion_id, :descripcion, :fecha_alta, :_destroy  ], 
       periodo_de_contratacion_attributes: [ :id, :descripcion, :fecha_desde, :fecha_hasta ])    
    end

    def asignar_datos_estaticos
      @sedes = Sede.all
      @tipo_contrataciones = TipoContratacion.all
      @acto_administrativos = ActoAdministrativo.all
      @agrupamientos = Agrupamiento.all
      @tramos = Tramo.all
      @areas = Area.all
    end
end
