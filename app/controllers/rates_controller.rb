class RatesController < ApplicationController
    before_action :set_zone, :set_concept, :set_plan
    before_action :set_rate, only: [:show, :update, :destroy]
  
    # GET /zonas/id/conceptos/id/planes/id/tarifas
    # GET /zonas/id/conceptos/id/planes/id/tarifas.json
    def index
      @rates = Rate.where(zone_id: @zone.id, concept_id: @concept.id, plan_id: @plan_id)
      render json: @rate
    end
  
    # GET /zonas/id/conceptos/id/planes/id/tarifas/id
    # GET /zonas/id/conceptos/id/planes/id/tarifas/id.json
    def show
      render json: @rate
    end
  
    # POST /zonas/id/conceptos/id/planes/id/tarifas
    # POST /zonas/id/conceptos/id/planes/id/tarifas.json
    def create
      @rate = Rate.new(rate_params)
      if @rate.save 
        render json: { status: :created }
      else
        render json: @rate.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /zonas/id/conceptos/id/planes/id/tarifas/id
    # PATCH/PUT /zonas/id/conceptos/id/planes/id/tarifas/id.json
    def update
        if @rate.update(rate_params)
          render json: { :message => "Success!" }
        else
          render json: @rate.errors, status: :unprocessable_entity
        end
      end
  
    # DELETE /zonas/id/conceptos/id/planes/id/tarifas/id
    # DELETE /zonas/id/conceptos/id/planes/id/tarifas/id.json
    def destroy
      if @rate.destroy()
        render json: { :message => "Success!" }
     else
        render json: { :message => "La tarifa no pudo ser eliminada" }
     end
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.

    # Me busca la zona por el id
    def set_zone
        @zone = Zone.find(params[:zone_id])
    end

    # Me busca el concepto por el id
    def set_concept
        @concept = Concept.find(params[:concept_id])
    end

    # Me busca el plan por el id
    def set_plan
      @plan = Plan.find(params[:plan_id])
  end
      
    # Me busca la tarifa por el id
    def set_rate
       @rate = Rate.find(params[:id])
    end

    #Le coloco los parametros que necesito de la tarifa para crearla y actualizarla
    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.require(:rate).permit(:plan_id, :zone_id, :concept_id, :valor, :estado, :usuario)
    end 
end

end
