class CitiesController < ApplicationController
    before_action :set_cities, only: [:show, :update, :destroy]
  
    # GET /cities
    # GET /cities.json
    def index
      @cities = City.all
      render json: @cities
    end
  
    # GET /cities/id
    # GET /cities/id.json
    def show
      render json: @city
    end
  
    # POST /cities
    # POST /cities.json
    def create
      @city = City.new(city_params)
      @city.tipo = company
      if @city.save 
        render json: { status: :created }
      else
        render json: @city.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /cities/id
    # PATCH/PUT /cities/id.json
    def update
        if @city.update(city_params)
          render json: { :message => "Success!" }
        else
          render json: @city.errors, status: :unprocessable_entity
        end
      end
  
    # DELETE /cities/id
    # DELETE /cities/id.json
    def destroy
      if @city.destroy()
        render json: { :message => "Success!" }
     else
        render json: { :message => "La concepto no pudo ser eliminada" }
     end
    end
  
    
    private
    # Use callbacks to share common setup or constraints between actions.

    # Me busca la ciudad por el id
    def set_city
      @city = City.find(params[:id])
    end
  
    #Le coloco los parametros que necesito de la ciudad para crearla y actualizarla

    # Never trust parameters from the scary internet, only allow the white list through.
    def city_params
      params.require(:city).permit(:nombre, :codigo, :usuario)
    end 
end
