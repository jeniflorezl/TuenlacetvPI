class NeighborhoodsController < ApplicationController
    before_action :set_neighborhood, only: [:show, :update, :destroy]
  
    # GET /barrios
    # GET /barrios.json
    def index
      @neighborhoods =  Neighborhood.all
      render json: @neighborhoods
    end

    # GET /barrios/id
    # GET /barrios/id.json
     # GET /barrios/zona_id
    # GET /barrios/zona_id.json
     # GET /barrios/nombre
    # GET /barrios/nombre.json
    def show
      render json: @neighborhood
    end
  
    # POST /barrios
    # POST /barrios.json
    def create
      @neighborhood = Neighborhood.new(neighborhood_params)
      if @neighborhood.save 
        render json: { status: :created }
      else
        render json: @neighborhood.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /barrios/id
    # PATCH/PUT /barrios/id.json
    def update
        if @neighborhood.update(neighborhood_params)
          render json: { :message => "Success!" }
        else
          render json: @neighborhood.errors, status: :unprocessable_entity
        end
      end
  
    # DELETE /barrios/id
    # DELETE /barrios/id.json
    def destroy
      if @neighborhood.destroy()
        render json: { :message => "Success!" }
     else
        render json: { :message => "El barrio no pudo ser eliminado" }
     end
    end
  
    private
    
    # Use callbacks to share common setup or constraints between actions.

    # Me busca el barrio por el id, por el id de la zona o por el nombre 
    def set_neighborhood
      @id = params[:id]
      @zona_id = params[:zone_id]
      @nombre = params[:nombre]
      if @id
        @neighborhood = Neighborhood.find(params[:id])
      elsif @zona_id
        @neighborhood = Neighborhood.where(zone_id: @zona_id)
      else
        @neighborhood = Neighborhood.where(nombre: @nombre)
      end
    end

    #Le coloco los parametros que necesito del barrio para crearlo y actualizarlo
    # Never trust parameters from the scary internet, only allow the white list through.
    def neighborhood_params
      params.require(:neighborhood).permit(:zone_id, :nombre, :usuario)
    end 
end
