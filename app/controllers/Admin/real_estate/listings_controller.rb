# frozen_string_literal: true

module Admin
  class ListingsController < AdminController

    def index
      @properties = Property.all
    end

    def show
      @property = Property.find_by(id: params[:id])
    end
  end
end
