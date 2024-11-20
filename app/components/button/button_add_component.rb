# frozen_string_literal: true

module Button
  class ButtonAddComponent < ViewComponent::Base
    renders_many :links, "LinkComponent" # Permite adicionar vários links

    class LinkComponent < ViewComponent::Base
      # Parâmetros esperados: name, href, icon, className
      def initialize(name:, href:, icon1: nil, icon2: nil, class_name: nil)
        @icon1 = icon1
        @name = name
        @href = href
        @icon2 = icon2
        @class_name = class_name
      end

      def call
        content_tag(:a, href: @href, class: "nav-link #{@class_name}") do
          concat(render_icon1) if @icon1.present? # Renderiza o ícone1, se existir
          concat(content_tag(:span, @name))    # Adiciona o texto do link
          concat(render_icon2) if @icon2.present? # Renderiza o ícone2, se existir
        end
      end

      private

      def render_icon1
        # Renderiza o partial do ícone, se disponível
        render(partial: "shared/icons/#{@icon1}") if @icon1.present?
      end
      def render_icon2
        # Renderiza o partial do ícone, se disponível
        render(partial: "shared/icons/#{@icon2}") if @icon2.present?
      end
    end
  end
end
