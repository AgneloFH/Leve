# frozen_string_literal: true
module Api
  module RealEstate
    module Properties
      class  RecordsController < ApiController
        before_action :set_property, only: %i[show edit update destroy]

        # Listar todos os imóveis
        def index
          @properties = Property.all
          render json: @properties
        end

        # Exibir detalhes de um imóvel específico
        def show
          render json: @property
        end

        # Exibir o formulário para criar um novo imóvel
        def new
          @property = Property.new
        end

        # Criar um novo imóvel
        def create
          @property = Property.new(property_params)

          if @property.save
            render json: { message: 'Imóvel criado com sucesso.', property: @property }, status: :created
          else
            render json: { errors: @property.errors.full_messages }, status: :unprocessable_entity
          end
        end

        # Exibir o formulário para editar um imóvel
        def edit
          render json: @property
        end

        # Atualizar um imóvel existente
        def update
          if @property.update(property_params)
            render json: { message: 'Imóvel atualizado com sucesso.', property: @property }, status: :ok
          else
            render json: { errors: @property.errors.full_messages }, status: :unprocessable_entity
          end
        end

        # Excluir um imóvel
        def destroy
          @property.destroy
          render json: { message: 'Imóvel excluído com sucesso.' }, status: :ok
        end

        private

        # Encontrar o imóvel pelo ID
        def set_property
          @property = Property.find_by(id: params[:id])
          render json: { error: 'Imóvel não encontrado.' }, status: :not_found unless @property
        end

        # Definir os parâmetros permitidos para Property
        def property_params
          params.require(:property).permit(
            :title, :description, :property_type_id, :usable_area, :total_area, :bedrooms,
            :bathrooms, :washrooms, :suites, :garage_space, :accepts_pets, :code
          )
        end
      end
    end
  end
end
