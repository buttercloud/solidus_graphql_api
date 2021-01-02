# frozen_string_literal: true

module SolidusGraphqlApi
  module Types
    class TaxAdjustment < Base::Object
      implements Types::Interfaces::Adjustment

      description 'TaxAdjustment.'
    end
  end
end
