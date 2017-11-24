class NeighborhoodsController < ApplicationController
    before_action :set_zone
    before_action :set_neighborhood, only: [:show, :update, :destroy]
  
    # GET /zona_id/barrios
    # GET /zona_id/barrios.json
    def index
      @neighborhoods =  @zone.neighborhoods
      render json: @neighborhoods
    end

    # GET /zona_id/barrios/id
    # GET /zona_id/barrios/id.json
    def show
      render json: @neighborhood
    end
  
    # POST /zona_id/barrios
    # POST /zona_id/barrios.json
    def create
      @neighborhood = @zone.neighborhoods.new(neighborhood_params)
      if @neighborhood.save 
        render json: { status: :created }
      else
        render json: @neighborhood.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /zonas/1/barrios/id
    # PATCH/PUT /zonas/1/barrios/id.json
    def update
        if @neighborhood.update(neighborhood_params)
          render json: { :message => "Success!" }
        else
          render json: @neighborhood.errors, status: :unprocessable_entity
        end
      end
  
    # DELETE /zonas/id
    # DELETE /zonas/id.json
    def destroy
      if @neighborhood.destroy()
        render json: { :message => "Success!" }
     else
        render json: { :message => "El barrio no pudo ser eliminado" }
     end
    end
  
    private
    
    # Use callbacks to share common setup or constraints between actions.

    # Me busca el barrio por el id
    def set_neighborhood
      @neighborhood = Neighborhood.find(params[:id])
    end

    # Me busca la zona por el id
    def set_zone
        @zone = Zone.find(params[:zone_id])

      end

    #Le coloco los parametros que necesito del barrio para crearlo y actualizarlo
    # Never trust parameters from the scary internet, only allow the white list through.
    def neighborhood_params
      params.require(:neighborhood).permit(:nombre, :usuario)
    end 
end
