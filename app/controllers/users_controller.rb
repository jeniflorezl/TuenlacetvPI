class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    
      # GET /usuarios
      # GET /usuarios.json
      def index
        @users = User.all
        render json: @users
      end
    
      # GET /usuarios/id
      # GET /usuarios/id.json
      # GET /usuarios/nombre
      # GET /usuarios/nombre.json
      def show
        render json: @user
      end
    
      # POST /usuarios
      # POST /usuarios.json
      def create
        @user = User.new(user_params)
        if @user.save 
          render json: { status: :created }
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end
    
      # PATCH/PUT /usuarios/id
      # PATCH/PUT /usuarios/id.json
      def update
          if @user.update(user_params)
            render json: { :message => "Success!" }
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
    
      # DELETE /usuarios/id
      # DELETE /usuarios/id.json
      def destroy
        if @user.destroy()
          render json: { :message => "Success!" }
       else
          render json: { :message => "La zona no pudo ser eliminada" }
       end
      end

      def change_password
        @clave = params[:clave]
        @user = User.find(params[:id])
        if @user.update(clave: @clave)
            render json: { :message => "Success!" }
        end
      end
        
      private
      # Use callbacks to share common setup or constraints between actions.
    
      # Me busca el usuario por el id, el login o el nombre
      def set_user
        @id = params[:id]
        @login = params[:login]
        @nombre = params[:nombre]
        if @id
            @user = User.find(params[:id])
        elsif @login
            @user = User.where(login: @login)
        else
            @user = User.where(nombre: @nombre)
        end
        
      end
    
      #Le coloco los parametros que necesito de la zona para crearla y actualizarla
    
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:login, :nombre, :clave, :nivel)
      end 
end
