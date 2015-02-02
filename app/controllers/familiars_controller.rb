class FamiliarsController < ApplicationController
  before_action :set_familiar, only: [:show, :edit, :update, :destroy]

  # GET /familiars
  # GET /familiars.json
  def index
    
    @agrente = Agrente.find(params[:agrente_id])
    @familiars = @agrente.familiars
  end

  # GET /familiars/1
  # GET /familiars/1.json
  def show
  end

  # GET /familiars/new
  def new
    @familiar = Familiar.new
    @agrente = Agrente.find(params[:agrente_id])
  end

  # GET /familiars/1/edit
  def edit
    @agrente = Agrente.find(params[:agrente_id])
    @familiar = Familiar.find(params[:id])
  end

  # POST /familiars
  # POST /familiars.json
  def create
    #@familiar = Familiar.new(familiar_params)
    @agrente = Agrente.find(params[:agrente_id])
    @familiar = @agrente.familiars.build(familiar_params)
    respond_to do |format|
      if @familiar.save
        format.html { redirect_to agrente_familiars_path(@agrente), notice: 'Familiar was successfully created.' }
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
        @agrente = Agrente.find(params[:agrente_id])
        format.html { redirect_to agrente_familiars_path(@agrente), notice: 'Familiar was successfully updated.' }
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
      format.html { redirect_to agrente_familiars_path(@familiar.agrente), notice: 'Familiar was successfully destroyed.' }
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
      params.require(:familiar).permit(:relacion, :cuil, :nombre, :apellido, :fecha_nac, :lugar_nac, :agrente_id)
    end
end
