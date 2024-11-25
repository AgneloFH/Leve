# frozen_string_literal: true

module Button
  class ButtonFilterComponent < ViewComponent::Base
    renders_many :links, "LinkComponent" # Permite adicionar vários links

    class LinkComponent < ViewComponent::Base
      # Parâmetros esperados: name, href, icon, className
      def initialize(name:, href:, icon: nil, class_name: nil)
        @icon = icon
        @name = name
        @href = href
        @class_name = class_name
      end

      def call
        content_tag(:a, href: @href, class: "nav-link #{@class_name}") do
          concat(render_icon) if @icon.present? # Renderiza o ícone1, se existir
          concat(content_tag(:span, @name))    # Adiciona o texto do link
        end
      end

      private

      def render_icon
        # Renderiza o partial do ícone, se disponível
        render(partial: "shared/icons/#{@icon}") if @icon.present?
      end
    end
  end
end