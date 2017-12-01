class UsersController < ApplicationController
  before_action :set_rol
  before_action :set_user_buscar, only: [:show]
  before_action :set_user, only: [:update, :destroy]

      # GET /usuarios
      # GET /usuarios.json
      def index
        if (@permiso)
          @users = User.all
          render json: @users
        end
      end
    
      # GET /usuarios/id
      # GET /usuarios/id.json
      # GET /usuarios/nombre
      # GET /usuarios/nombre.json
      def show
        render json: [*@user]
      end
    
      # POST /usuarios
      # POST /usuarios.json
      def create
        if (@permiso)
          @user = User.new(user_params)
          if @user.save 
            render json: { status: :created }
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
      end
    
      # PATCH/PUT /usuarios/id
      # PATCH/PUT /usuarios/id.json
      def update
        t = Time.now
        @user.fechacam = t.strftime("%d/%m/%Y %H:%M:%S")
        if(@permiso)
            if @user.update(user_params)
              render json: { :message => "Success!" }
            else
              render json: @user.errors, status: :unprocessable_entity
            end
          end
        end
    
      # DELETE /usuarios/id
      # DELETE /usuarios/id.json
      def destroy
        if(@permiso)
          if @user.destroy()
              render json: { :message => "Success!" }
          else
              render json: { :message => "La zona no pudo ser eliminada" }
          end
        end
      end

      def change_password
        @clave = params[:clave]
        @user = User.find(params[:id])
        if @user.update(clave: @clave)
            render json: { :message => "Success!" }
        end
      end

      def login
        @user = params[:user]
        @clave = params[:clave]
        @usuario = User.where(login: @user).take
        #byebug
        if (@usuario.clave == @clave)
          render json: { :message => "Success" }
        else
          render json: { :message => "Datos Incorrectos" }
        end
      end
        
      private
      # Use callbacks to share common setup or constraints between actions.
    
      # Me busca el usuario por el id, el login o el nombre
      def set_user_buscar
        @campo = params[:campo]
        @valor = params[:valor]
        if @campo == 'codigo'
          @user = User.find(params[:valor])
        elsif @campo == 'login'
          @user = User.limit(10).where("login LIKE '%#{@valor}%'")
        else
          @user = User.limit(10).where("nombre LIKE '%#{@valor}%'")
        end
      end

      def set_user
        @user = User.find(params[:id])
      end

      def set_rol
        if (@user.nivel == '1')
          @permiso = true
        end
      end
    
      #Le coloco los parametros que necesito de la zona para crearla y actualizarla
    
      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:login, :nombre, :clave, :nivel, :usuario)
      end 
end
