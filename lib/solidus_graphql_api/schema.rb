# frozen_string_literal: true

module SolidusGraphqlApi
  class Schema < GraphQL::Schema
    query Types::Query
    mutation Types::Mutation

    use ::BatchLoader::GraphQL

    rescue_from CanCan::AccessDenied do |exception|
      raise GraphQL::ExecutionError, exception.message
    end

    rescue_from ActiveRecord::RecordNotFound do
      raise GraphQL::ExecutionError, I18n.t(:'activerecord.exceptions.not_found')
    end
  end
end
