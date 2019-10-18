# frozen_string_literal: true

module Spree
  module Queries
    class ProductBySlugQuery
      def call(slug:)
        Spree::Product.find_by slug: slug
      end
    end
  end
end
