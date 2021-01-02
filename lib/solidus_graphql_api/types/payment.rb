# frozen_string_literal: true

module SolidusGraphqlApi
  module Types
    class Payment < Base::Object
      description 'Payment.'

      field :amount, String, null: true
      field :state, String, null: false
      field :created_at, GraphQL::Types::ISO8601DateTime, null: true
      field :payment_source, Types::Interfaces::PaymentSource, null: true
      field :updated_at, GraphQL::Types::ISO8601DateTime, null: true
    end
  end
end
