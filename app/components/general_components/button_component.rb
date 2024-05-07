# frozen_string_literal: true

class GeneralComponents::ButtonComponent < ViewComponent::Base
  def initialize(text:, disabled:)
    super
    @text = text
    @disabled = disabled
  end

  def disabled?
    @disabled
  end
end
