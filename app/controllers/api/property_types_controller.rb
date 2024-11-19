# frozen_string_literal: true

module Api
  class PropertyTypesController < AdminController
    before_action :set_property_type, only: %i[show edit update]

    # Exibe a lista de PropertyTypes ordenados pelo nome
    def index
    @property_types = PropertyType.order(:name)
    end

    # Exibe um único PropertyType (apenas para visualização)
    def show
      @property_type = PropertyType.find(params[:id])
    end

    # Exibe o formulário para criação de um novo PropertyType
    def new
      @property_type = PropertyType.new
    end

    # Cria um novo PropertyType e salva no banco de dados
    def create
      @property_type = PropertyType.new(property_type_params)
      if @property_type.save
        render json: @property_type, status: :created
      else
        render json: @property_type.errors, status: :unprocessable_entity
      end
    end

    # Exibe o formulário para editar um PropertyType existente
    def edit
      @property_type = PropertyType.find(params[:id])
    end

    # Atualiza um PropertyType existente
    def update
      @property_type = PropertyType.find(params[:id])
      if @property_type.update(property_type_params)
        redirect_to v1_real_estate_admin_settings_property_types_path, notice: 'Property Type updated successfully'
      else
        render :edit
      end
    end

    private

    def set_property_type
      @property_type = PropertyType.find(params[:id])
    end

    # Define os parâmetros permitidos para PropertyType
    def property_type_params
      params.require(:property_types).permit(id: :name)
    end
  end
end
