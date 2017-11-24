class ConceptsController < ApplicationController
    before_action :set_concept, only: [:show, :update, :destroy]
  
    # GET /conceptos
    # GET /conceptos.json
    def index
      @concepts = Concept.all
      render json: @concepts
    end
  
    # GET /conceptos/id
    # GET /conceptos/id.json
    def show
      render json: @concept
    end
  
    # POST /conceptos
    # POST /conceptos.json
    def create
      @concept = Concept.new(concept_params)
      if @concept.save 
        render json: { status: :created }
      else
        render json: @concept.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /conceptos/id
    # PATCH/PUT /conceptos/id.json
    def update
        if @concept.update(concept_params)
          render json: { :message => "Success!" }
        else
          render json: @concept.errors, status: :unprocessable_entity
        end
      end
  
    # DELETE /conceptos/id
    # DELETE /conceptos/id.json
    def destroy
      if @concept.destroy()
        render json: { :message => "Success!" }
     else
        render json: { :message => "La concepto no pudo ser eliminada" }
     end
    end
  
    private
    # Use callbacks to share common setup or constraints between actions.

    # Me busca el concepto por el id
    def set_concept
      @concept = Concept.find(params[:id])
    end
  
    #Le coloco los parametros que necesito de el concepto para crearlo y actualizarlo

    # Never trust parameters from the scary internet, only allow the white list through.
    def concept_params
      params.require(:concept).permit(:descripcion, :operacion, :valor, :clase, :iva,
      :tipodoc, :observa :usuario)
    end 
end
