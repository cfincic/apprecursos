class SituacionRevistaController < ApplicationController
  before_action :set_situacion_revistum, only: [:show, :edit, :update, :destroy]

  # GET /situacion_revista
  # GET /situacion_revista.json
  def index
    @situacion_revista = SituacionRevistum.all
  end

  # GET /situacion_revista/1
  # GET /situacion_revista/1.json
  def show
  end

  # GET /situacion_revista/new
  def new
    @situacion_revistum = SituacionRevistum.new
  end

  # GET /situacion_revista/1/edit
  def edit
  end

  # POST /situacion_revista
  # POST /situacion_revista.json
  def create
    @situacion_revistum = SituacionRevistum.new(situacion_revistum_params)

    respond_to do |format|
      if @situacion_revistum.save
        format.html { redirect_to @situacion_revistum, notice: 'Situacion revistum was successfully created.' }
        format.json { render :show, status: :created, location: @situacion_revistum }
      else
        format.html { render :new }
        format.json { render json: @situacion_revistum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /situacion_revista/1
  # PATCH/PUT /situacion_revista/1.json
  def update
    respond_to do |format|
      if @situacion_revistum.update(situacion_revistum_params)
        format.html { redirect_to @situacion_revistum, notice: 'Situacion revistum was successfully updated.' }
        format.json { render :show, status: :ok, location: @situacion_revistum }
      else
        format.html { render :edit }
        format.json { render json: @situacion_revistum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /situacion_revista/1
  # DELETE /situacion_revista/1.json
  def destroy
    @situacion_revistum.destroy
    respond_to do |format|
      format.html { redirect_to situacion_revista_url, notice: 'Situacion revistum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_situacion_revistum
      @situacion_revistum = SituacionRevistum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def situacion_revistum_params
      params.require(:situacion_revistum).permit(:descripcion)
    end
end
