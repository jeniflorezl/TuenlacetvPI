class CompaniesController < ApplicationController
    before_action :set_company_buscar, only: [:show]
    before_action :set_company, only: [:update, :destroy]
    
        # GET /empresas
        # GET /empresas.json
        def index
            @companies = Company.all
            @cities = City.all
            #render json: @companies
            render json: { :companies => @companies, :cities => @cities }
        end
    
        # GET /empresas/id
        # GET /empresas/id.json
        def show
            render json: [*@company]
        end

        # POST /empresas
        # POST /empresas.json
        def create
            @company = Company.new(company_params)
            @company.tipo = '01'
            if @company.save 
                render json: { status: :created }
            else
                render json: @company.errors, status: :unprocessable_entity
            end
        end
    
        # PATCH/PUT /empresas/id
        # PATCH/PUT /empresas/id.json
        def update
            t = Time.now
            @company.fechacam = t.strftime("%d/%m/%Y %H:%M:%S")
            if @company.update(company_params)
                render json: { :message => "Success!" }
            else
                render json: @company.errors, status: :unprocessable_entity
            end
        end
    
        # DELETE /empresas/id
        # DELETE /empresas/id.json
        def destroy
            if @company.destroy()
                render json: { :message => "Success!" }
            else
                render json: { :message => "La zona no pudo ser eliminada" }
            end
        end
    
        private
            # Use callbacks to share common setup or constraints between actions.

            # Me busca la empresa por el id
            def set_company
                @company = Company.find(params[:id]);
            end

            def set_company_buscar
                @campo = params[:campo]
                @valor = params[:valor]
                query = <<-SQL 
                SELECT TOP(10) * FROM companies WHERE #{@campo} LIKE '%#{@valor}%';
                SQL
                @company = ActiveRecord::Base.connection.select_all(query)
                #if @campo == 'nit'
                  #@zone = Company.find(params[:valor])
                #else
                 # @zone = Company.limit(10).where("nombre LIKE '%#{@valor}%'")
                #end
                
              end
    
            #Le coloco los parametros que necesito de la empresa para crearla y actualizarla

            # Never trust parameters from the scary internet, only allow the white list through.
            def company_params
                params.require(:company).permit(:nit, :nombre, :direccion, :telefono1, :telefono2, 
                :fax, :contacto, :correo, :regimen, :actividade, :contribuyente, :resolucionCntv, 
                :representante, :idciudad, :prefijo, :titulo1, :titulo2, :logo, :usuario)
            end 
end
