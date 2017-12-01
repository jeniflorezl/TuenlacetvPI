class SignalTvsController < ApplicationController
  before_action :set_signal_buscar, only: [:show]
  before_action :set_signal, only: [:update, :destroy]
    
      # GET /señales
      # GET /señales.json
      def index
        @signals = SignalTv.all
        render json: @signals
      end
    
      # GET /señales/direccion
      # GET /señales/direccion.json
      # GET /señales/estado
      # GET /señales/estado.json
      # GET /señales/tarifa
      # GET /señales/tarifa.json
      def show
        render json: [*@signal]
      end
    
      # POST /señales
      # POST /señales.json
      def create
        @signal = SignalTv.new(signal_params)
        if @signal.save 
          render json: { status: :created }
        else
          render json: @signal.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /señales/id
      # PATCH/PUT /señales/id.json
      def update
        t = Time.now
        @signal.fechacam = t.strftime("%d/%m/%Y %H:%M:%S")
          if @signal.update(signal_params)
            render json: { :message => "Success!" }
          else
            render json: @signal.errors, status: :unprocessable_entity
          end
        end
    
      # DELETE /señales/id
      # DELETE /señales/id.json
      def destroy
        if @signal.destroy()
          render json: { :message => "Success!" }
       else
          render json: { :message => "La zona no pudo ser eliminada" }
       end
      end
    
      private
      # Use callbacks to share common setup or constraints between actions.
    
      # Me busca la persona por el id, o el nit, o el nombre1, o el nombre2, o el apellido1,
      # o el apellido2, o la zona, o el barrio, o el telefono1, o la funcion
      def set_signal_buscar
        @campo = params[:campo]
        @valor = params[:valor]
        query = <<-SQL 
        SELECT TOP(10) * FROM signals WHERE #{@campo} LIKE '%#{@valor}%';
        SQL
        @signal = ActiveRecord::Base.connection.select_all(query)
        #byebug
      end

      def set_signal
        @signal = SignalTv.find(params[:id])
      end
     

      #Le coloco los parametros que necesito de la zona para crearla y actualizarla
    
      # Never trust parameters from the scary internet, only allow the white list through.
      def signal_params
        params.require(:signal_tv).permit(:entity_id, :contrato, :direccion, :urbanizacion, :torre, :apto, 
        :estrato, :vivienda, :telefono1, :telefono2, :contacto,:neighborhood_id, :zone_id, 
        :fechacontrato, :numerotvs, :estado, :rate_id, :precinto, :type_installation_id, :technology_id,
        :tiposervicio, :areainstalacion, :usuario)
      end 
end
