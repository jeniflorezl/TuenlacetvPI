class PeopleController < ApplicationController
  before_action :set_person_buscar, only: [:show]
  before_action :set_person, only: [:update, :destroy]
    
      # GET /personas
      # GET /personas.json
      def index
        @people = Person.all
        @type_documents = TypeDocument.all
        @neighborhoods = Neighborhood.all
        @zones = Zone.all
        #render json: @people
        render json: { :people => @people, :type_documents => @type_documents, :neighborhoods => @neighborhoods, 
        :zones => @zones } 
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
        render json: [*@person]
      end
    
      # POST /personas
      # POST /personas.json
      def create
        @funcion = params[:funcion]
        @person = Person.new(person_params)
        if @person.save 
          #byebug
          if createEntity()
            render json: [*@entity]
          else
            render json: @person.errors, status: :unprocessable_entity
         end
        end
      end
    
      # PATCH/PUT /personas/id
      # PATCH/PUT /personas/id.json
      def update
        t = Time.now
        @person.fechacam = t.strftime("%d/%m/%Y %H:%M:%S")
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
      def set_person
        @person = Person.find(params[:id])
      end

      #crear entidad
      def createEntity
        @idPerson = @person.id
        @usuario = @person.usuario
        entity = { "function_id" => @funcion, "person_id" => @idPerson, "usuario" => @usuario}
        @entity = Entity.new(entity)
        if @entity.save 
          return true
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
