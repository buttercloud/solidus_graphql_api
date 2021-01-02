# frozen_string_literal: true

module SolidusGraphqlApi
  module Types
    class OptionType < Base::Object
      graphql_name 'OptionType'

      description 'OptionType Type.'

      field :name, String, null: false
      field :presentation, String, null: false
      field :position, Int, null: false
      field :option_values, [Types::OptionValue], null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true

      def option_values
        Queries::OptionType::OptionValuesQuery.new(option_type: object).call
      end
    end
  end
end
