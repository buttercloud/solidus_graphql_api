# frozen_string_literal: true

module SolidusGraphqlApi
  module Types
    class Variant < Base::Object
      description 'Variant.'

      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :default_price, Price, null: false
      field :depth, String, null: true
      field :height, String, null: true
      field :images, [Types::Image], null: false
      field :is_master, Boolean, null: false
      field :option_values, [Types::OptionValue], null: false
      field :position, Int, null: false
      field :prices, [Types::Price], null: false
      field :sku, String, null: false
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
      field :weight, String, null: false
      field :width, String, null: true

      def default_price
        Queries::Variant::DefaultPriceQuery.new(variant: object).call
      end

      def images
        Queries::Variant::ImagesQuery.new(variant: object).call
      end

      def option_values
        Queries::Variant::OptionValuesQuery.new(variant: object).call
      end

      def prices
        Queries::Variant::PricesQuery.new(variant: object).call
      end
    end
  end
end
