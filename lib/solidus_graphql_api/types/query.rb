# frozen_string_literal: true

module SolidusGraphqlApi
  module Types
    class Query < Base::Object
      field :countries, [Types::Country],
            null: false,
            description: 'Supported Countries.'

      field :completed_orders, [Types::Order],
            null: false,
            description: 'Customer Completed Orders.'

      field :products, [Types::Product],
            null: false,
            description: 'Supported Products.' do
              argument :query, Types::InputObjects::ProductsQueryInput, required: false
            end

      field :product_by_slug, Types::Product,
            null: true,
            description: 'Find a product by its slug.' do
              argument :slug, String, required: true
            end

      field :taxonomies, [Types::Taxonomy],
            null: false,
            description: 'Supported Taxonomies.'

      field :current_user, Types::User,
            null: true,
            description: 'Current logged User.'

      field :current_store, Types::Store,
            null: true,
            description: 'Current Store.'

      field :current_order, Types::Order,
            null: true,
            description: 'Current Order.'

      def countries
        Queries::CountriesQuery.new.call
      end

      def completed_orders
        Queries::CompletedOrdersQuery.new(user: context[:current_user]).call
      end

      def products(query: {})
        Queries::ProductsQuery.new(
          user: context[:current_user],
          pricing_options: context[:current_pricing_options]
        ).call(query: query)
      end

      def product_by_slug(slug:)
        Queries::ProductBySlugQuery.new.call(slug: slug)
      end

      def taxonomies
        Queries::TaxonomiesQuery.new.call
      end

      def current_user
        context[:current_user]
      end

      def current_store
        context[:current_store]
      end

      def current_order
        context[:current_order]
      end
    end
  end
end
