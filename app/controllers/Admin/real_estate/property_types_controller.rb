# frozen_string_literal: true

module Admin
  class PropertyTypesController < AdminController

    # Exibe a lista de PropertyTypes ordenados pelo nome
    def index
      @property_types = PropertyType.order(:name)
    end

    # Exibe o formulário para criação de um novo PropertyType
    def new
      @property_type = PropertyType.new
    end
  end
end
