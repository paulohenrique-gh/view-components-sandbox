# frozen_string_literal: true

class GeneralComponents::ButtonComponent < ViewComponent::Base
  def initialize(text:, disabled:)
    @text = text
    @disabled = disabled
  end

  def disabled?
    @disabled
  end
end
