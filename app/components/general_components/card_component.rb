# frozen_string_literal: true

class GeneralComponents::CardComponent < ViewComponent::Base
  renders_one :header
  renders_one :body

  def initialize(img_url: nil)
    @img_url = img_url
  end
end
