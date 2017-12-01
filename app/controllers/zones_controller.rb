class ZonesController < ApplicationController
  before_action :set_zone_buscar, only: [:show]
  before_action :set_zone, only: [:update, :destroy]

  # GET /zonas
  # GET /zonas.json
  def index
    @zones = Zone.all
    render json: @zones
    #@zones
  end

  # GET /zonas/id
  # GET /zonas/id.json
  # GET /zonas/nombre
  # GET /zonas/nombre.json
  def show
    render json: [*@zone]
  end

  # POST /zonas
  # POST /zonas.json
  def create
    @city = City.first
    @idcity= @city.id
    @zone = Zone.new(zone_params)
    @zone.city_id = @idcity
    if @zone.save 
      render json: { status: :created }
    else
      render json: @zone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /zonas/id
  # PATCH/PUT /zonas/id.json
  def update
    t = Time.now
    @zone.fechacam = t.strftime("%d/%m/%Y %H:%M:%S")
    if @zone.update(zone_params)
      render json: { :message => "Success!" }
    else
      render json: @zone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /zonas/id
  # DELETE /zonas/id.json
  def destroy
    if @zone.destroy()
      render json: { :message => "Success!" }
   else
      render json: { :message => "La zona no pudo ser eliminada" }
   end
  end

  private
  # Use callbacks to share common setup or constraints between actions.

  # Me busca la zona por el id o el nombre
  def set_zone_buscar
    @campo = params[:campo]
    @valor = params[:valor]
    if @campo == 'codigo'
      @zone = Zone.find(params[:valor])
    else
      @zone = Zone.limit(10).where("nombre LIKE '%#{@valor}%'")
    end
  end

  def set_zone
    @zone = Zone.find(params[:id])
  end
    

  #Le coloco los parametros que necesito de la zona para crearla y actualizarla

  # Never trust parameters from the scary internet, only allow the white list through.
  def zone_params
    params.require(:zone).permit(:nombre, :dirquejas, :usuario)
  end 
end
