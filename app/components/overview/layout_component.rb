# frozen_string_literal: true

module Overview
  class LayoutComponent < ViewComponent::Base
    renders_one :containerText
    renders_one :containerFunctionOne
    renders_one :containerFunctionThree
  end
end
