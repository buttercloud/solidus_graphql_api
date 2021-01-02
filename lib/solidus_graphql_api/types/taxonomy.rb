# frozen_string_literal: true

module SolidusGraphqlApi
  module Types
    class Taxonomy < Base::Object
      description 'Taxonomy.'

      field :name, String, null: false
      field :root_taxon, Taxon, null: true
      field :taxons, [Types::Taxon], null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

      def root_taxon
        Queries::Taxonomy::RootTaxonQuery.new(taxonomy: object).call
      end

      def taxons
        Queries::Taxonomy::TaxonsQuery.new(taxonomy: object).call
      end
    end
  end
end
