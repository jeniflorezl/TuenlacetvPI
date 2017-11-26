class PeopleController < ApplicationController
    before_action :set_person, only: [:show, :update, :destroy]
    
      # GET /personas
      # GET /personas.json
      def index
        @people = Person.all
        render json: @people
      end
    
      # GET /personas/id
      # GET /personas/id.json
      # GET /personas/documento
      # GET /personas/documento.json
      # GET /personas/nombre1
      # GET /personas/nombre1.json
      # GET /personas/nombre2
      # GET /personas/nombre2.json
      # GET /personas/apellido1
      # GET /personas/apellido1.json
      # GET /personas/apellido2
      # GET /personas/apellido2.json
      # GET /personas/zona
      # GET /personas/zona.json
      # GET /personas/barrio
      # GET /personas/barrio.json
      # GET /personas/telefono1
      # GET /personas/telefono1.json
      # GET /personas/funcion
      # GET /personas/funcion.json
      def show
        render json: @person
      end
    
      # POST /personas
      # POST /personas.json
      def create
        @person = Person.new(person_params)
        if @person.save 
          render json: { status: :created }
        else
          render json: @person.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /personas/id
      # PATCH/PUT /personas/id.json
      def update
          if @person.update(person_params)
            render json: { :message => "Success!" }
          else
            render json: @person.errors, status: :unprocessable_entity
          end
        end
    
      # DELETE /personas/id
      # DELETE /personas/id.json
      def destroy
        if @person.destroy()
          render json: { :message => "Success!" }
       else
          render json: { :message => "La zona no pudo ser eliminada" }
       end
      end
    
      private
      # Use callbacks to share common setup or constraints between actions.
    
      # Me busca la persona por el id, o el nit, o el nombre1, o el nombre2, o el apellido1,
      # o el apellido2, o la zona, o el barrio, o el telefono1, o la funcion
      def set_person
        @id = params[:id]
        @documento = params[:documento]
        @nombre1 = params[:nombre1]
        @nombre2 = params[:nombre2]
        @apellido1 = params[:apellido1]
        @apellido2 = params[:apellido2]
        @zona = params[:zone_id]
        @barrio = params[:neighborhood_id]
        @telefono1 = params[:telefono1]
        @direccion = params[:direccion]
        @funcion = params[:function_id]
        if @id
          @person = Person.find(params[:id])
        elsif @documento
          @person = Person.where(documento: @documento)
        elsif @nombre1
          @person = Person.where(nombre1: @nombre1)
        elsif @nombre2
          @person = Person.where(nombre2: @nombre2)
        elsif @apellido1
          @person = Person.where(apellido1: @apellido1)
        elsif @apellido2
          @person = Person.where(apellido2: @apellido2)
        elsif @zona
          @person = Person.where(zone_id: @zona)
        elsif @barrio
          @person = Person.where(neighborhood_id: @barrio)
        elsif @telefono1
          @person = Person.where(telefono1: @telefono1)
        elsif @direccion
          @person = Person.where(direccion: @direccion)
        elsif @funcion
          @person = Person.joins(:entities).where('entities.function_id' => @funcion)
          #@person = Person.joins("INNER JOIN entities ON entities.person_id = people.id AND entities.function_id = '#{@funcion}'")
        end
        
      end
    
      #Le coloco los parametros que necesito de la zona para crearla y actualizarla
    
      # Never trust parameters from the scary internet, only allow the white list through.
      def person_params
        params.require(:person).permit(:type_document_id, :documento, :nombre1, :nombre2,
        :apellido1, :apellido2, :direccion, :neighborhood_id, :zone_id, :telefono1, :telefono2,
        :correo, :fechanac, :tipopersona, :estrato, :usuario)
      end 
end
