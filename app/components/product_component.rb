# frozen_string_literal: true

class ProductComponent < ViewComponent::Base
  with_collection_parameter :product

  def initialize(product:)
    @title = product[:title]
    @description = product[:description]
  end
end
