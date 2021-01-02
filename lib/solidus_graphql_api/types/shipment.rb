# frozen_string_literal: true

module SolidusGraphqlApi
  module Types
    class Shipment < Base::Object
      description 'Order Shipment.'

      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :number, String, null: false
      field :shipped_at, GraphQL::Types::ISO8601DateTime, null: true
      field :shipping_rates, [Types::ShippingRate], null: false
      field :state, String, null: false
      field :tracking, String, null: true
      field :tracking_url, String, null: true
      field :manifest, [Types::ManifestItem], null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

      def shipping_rates
        Queries::Shipment::ShippingRatesQuery.new(shipment: object).call
      end
    end
  end
end
