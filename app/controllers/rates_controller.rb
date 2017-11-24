class RatesController < ApplicationController
    before_action :set_rate, only: [:show, :update, :destroy]
  
    # GET /tarifas
    # GET /tarifas.json
    def index
      @rates = Rate.all
      render json: @rates
    end
  
    # GET /tarifas/id
    # GET /tarifas/id.json
    # GET /tarifas/zona_id
    # GET /tarifas/zona_id.json
    # GET /tarifas/concepto_id
    # GET /tarifas/concepto_id.json
    # GET /tarifas/valor
    # GET /tarifas/valor.json
    def show
      render json: @rate
    end
  
    # POST /tarifas
    # POST /tarifas.json
    def create
      @rate = Rate.new(rate_params)
      if @rate.save 
        render json: { status: :created }
      else
        render json: @rate.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /tarifas/id
    # PATCH/PUT /tarifas/id.json
    def update
        if @rate.update(rate_params)
          render json: { :message => "Success!" }
        else
          render json: @rate.errors, status: :unprocessable_entity
        end
      end
  
    # DELETE /tarifas/id
    # DELETE /tarifas/id.json
    def destroy
      if @rate.destroy()
        render json: { :message => "Success!" }
     else
        render json: { :message => "La tarifa no pudo ser eliminada" }
     end
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.

    # Me busca la tarifa por el id, por la zona, o el concepto, o el plan, o el valor
    def set_rate
      @id = params[:id]
      @zona_id = params[:zone_id]
      @concepto_id = params[:concept_id]
      @plan_id = params[:plan_id]
      @valor = params[:valor]
      if @id
       @rate = Rate.find(params[:id])
      elsif @zona_id
        @rate = Rate.where(zone_id: @zona_id)
      elsif @concepto_id
        @rate = Rate.where(concept_id: @concepto_id)
      elsif @plan_id
        @rate = Rate.where(plan_id: @plan_id)
      else 
        @rate = Rate.where(valor: @valor)
    end

    #Le coloco los parametros que necesito de la tarifa para crearla y actualizarla
    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.require(:rate).permit(:zone_id, :concept_id, :plan_id, :valor, :estado, :usuario)
    end 
end

end
