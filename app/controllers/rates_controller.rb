class RatesController < ApplicationController
  before_action :set_rate_buscar, only: [:show]
  before_action :set_rate, only: [:update, :destroy]
  
    # GET /tarifas
    # GET /tarifas.json
    def index
      @rates = Rate.all
      @zones = Zone.all
      @concepts = Concept.all
      @plans = Plan.all
      #render json: @rates
      render json: { :rates => @rates, :zones => @zones, :concepts => @concepts, :plans => @plans } 
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
      render json: [*@rate]
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
      t = Time.now
      @rate.fechacam = t.strftime("%d/%m/%Y %H:%M:%S")
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
    def set_rate_buscar
      @campo = params[:campo]
      @valor = params[:valor]
      if @campo == 'codigo'
        @rate = Rate.find(params[:valor])
      elsif @campo == 'zona'
        @rate = Rate.limit(10).where(zone_id: @valor)
      elsif @campo == 'concepto'
        @rate = Rate.limit(10).where(concept_id: @valor)
      elsif @campo == 'plan'
        @rate = Rate.limit(10).where(plan_id: @valor)
      else
        @rate = Rate.limit(10).where(valor: @valor)
      end
    end

    def set_rate
      @rate = Rate.find(params[:id])
    end

    #Le coloco los parametros que necesito de la tarifa para crearla y actualizarla
    # Never trust parameters from the scary internet, only allow the white list through.
    def rate_params
      params.require(:rate).permit(:zone_id, :concept_id, :plan_id, :valor, :estado, :usuario)
    end 


end
