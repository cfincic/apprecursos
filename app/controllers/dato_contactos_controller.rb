class DatoContactosController < ApplicationController
  before_action :set_dato_contacto, only: [:show, :edit, :update, :destroy]

  # GET /dato_contactos
  # GET /dato_contactos.json
  def index
   
    @agente = Agrente.find(params[:agrente_id])
     @dato_contactos = @agente.dato_contactos
  end

  # GET /dato_contactos/1
  # GET /dato_contactos/1.json
  def show
  end

  # GET /dato_contactos/new
  def new
    @dato_contacto = DatoContacto.new
    @agente = Agrente.find(params[:agrente_id])
  end

  # GET /dato_contactos/1/edit
  def edit
  end

  # POST /dato_contactos
  # POST /dato_contactos.json
  def create
    #@dato_contacto = DatoContacto.new(dato_contacto_params)
    @agrente = Agrente.find(params[:agrente_id])
    @dato_contacto = @agrente.dato_contactos.build(dato_contacto_params)

    respond_to do |format|
      if @dato_contacto.save
        @agente = Agrente.find(params[:agrente_id])
        format.html { redirect_to agrente_dato_contactos_path(@agente), notice: 'Dato contacto was successfully created.' }
        format.json { render :show, status: :created, location: @dato_contacto }
      else
        format.html { render :new }
        format.json { render json: @dato_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dato_contactos/1
  # PATCH/PUT /dato_contactos/1.json
  def update
    respond_to do |format|
      if @dato_contacto.update(dato_contacto_params)
        format.html { redirect_to @dato_contacto, notice: 'Dato contacto was successfully updated.' }
        format.json { render :show, status: :ok, location: @dato_contacto }
      else
        format.html { render :edit }
        format.json { render json: @dato_contacto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dato_contactos/1
  # DELETE /dato_contactos/1.json
  def destroy
    @agente = Agrente.find(params[:agrente_id])
    @dato_contacto.destroy
    respond_to do |format|
      format.html { redirect_to agrente_dato_contactos_path(@agente), notice: 'Dato contacto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dato_contacto
      @dato_contacto = DatoContacto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dato_contacto_params
      params.require(:dato_contacto).permit(:telefono_casa, :telefono_celu, :email, :direccion, :ciudad, :cod_postal, :provincia, :otro, :agrente_id)
    end
end
