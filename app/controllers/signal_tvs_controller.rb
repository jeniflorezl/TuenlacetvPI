class SignalTvsController < ApplicationController
    before_action :set_signal, only: [:show, :update, :destroy]
    
      # GET /señales
      # GET /señales.json
      def index
        @signal = Signal_tv.all
        render json: @signal
      end
    
      # GET /señales/direccion
      # GET /señales/direccion.json
      # GET /señales/estado
      # GET /señales/estado.json
      # GET /señales/tarifa
      # GET /señales/tarifa.json
      def show
        render json: @signal
      end
    
      # POST /señales
      # POST /señales.json
      def create
        @signal = Signal_tv.new(signal_params)
        if @signal.save 
          render json: { status: :created }
        else
          render json: @signal.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /señales/id
      # PATCH/PUT /señales/id.json
      def update
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
      def set_signal
        @campo = params[:campo]
        @valor = params[:valor]
        #@documento = params[:documento]
        #@nombre1 = params[:nombre1]
        #@nombre2 = params[:nombre2]
        #@apellido1 = params[:apellido1]
        #@apellido2 = params[:apellido2]
        #@zona = params[:zone_id]
        #@barrio = params[:neighborhood_id]
        #@telefono1 = params[:telefono1]
        #@funcion = params[:function_id]
        #@direccion = params[:direccion]
        #@estado = params[:estado]
        #@tarifa = params[:rate_id]
        if @id
          opcion=1
            @signal = Person.joins("INNER JOIN entities e ON e.person_id = people.id 
            INNER JOIN signal_tvs s ON s.entity_id = e.id")
        elsif @documento
          opcion=2
            #@person = Person.where(documento: @documento)
        elsif @nombre1
          opcion=2
            #@person = Person.where(nombre1: @nombre1)
        elsif @nombre2
          opcion=2
            #@person = Person.where(nombre2: @nombre2)
        elsif @apellido1
          opcion=2
            #@person = Person.where(apellido1: @apellido1)
        elsif @apellido2
          opcion=2
            #@person = Person.where(apellido2: @apellido2)
        elsif @zona
          opcion=3
            #@person = Person.where(zone_id: @zona)
        elsif @barrio
          opcion=3
            #@person = Person.where(neighborhood_id: @barrio)
        elsif @telefono1
          opcion=3
            #@person = Person.where(telefono1: @telefono1)
        elsif @direccion
          opcion=3
            #@person = Person.joins("INNER JOIN entities ON entities.person_id = people.id AND entities.function_id = '#{@funcion}'")
        elsif @estado
          opcion=3
        elsif @tarifa
          opcion=3
        end
        case opcion
        when 1
          query = <<-SQL 
          SELECT people.*, signal_tvs.*
          FROM people p
          INNER JOIN entities e
                  ON p.id = e.person_id
          INNER JOIN signal_tvs s
                  ON  e.id = s.entity_id
          WHERE payment_details.created_at DESC
          SQL
        "It's between 1 and 5"
        when 6
        "It's 6"
        when "foo", "bar"
        "It's either foo or bar"
        when String
        "You passed a string"
        else
        "You gave me #{a} -- I have no idea what to do with that."
        end
        query = <<-SQL 
        SELECT people.*, signal_tvs.*
        FROM people p
        INNER JOIN entities e
                ON p.id = e.person_id
        INNER JOIN signal_tvs s
                ON  e.id = s.entity_id
        SQL
        @signal = ActiveRecord::Base.connection.execute(query)
        
      end
    
      #Le coloco los parametros que necesito de la zona para crearla y actualizarla
    
      # Never trust parameters from the scary internet, only allow the white list through.
      def signal_params
        params.require(:person).permit(:type_document_id, :documento, :nombre1, :nombre2,
        :apellido1, :apellido2, :direccion, :neighborhood_id, :zone_id, :telefono1, :telefono2,
        :correo, :fechanac, :tipopersona, :estrato, :usuario)
      end 
end
