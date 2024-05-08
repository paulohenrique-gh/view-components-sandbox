# frozen_string_literal: true

class GeneralComponents::ButtonComponent < ViewComponent::Base
  delegate :random_color, to: :helpers

  def initialize(text:, disabled:)
    super
    @text = text
    @disabled = disabled
  end

  def disabled?
    @disabled
  end

  def color
    random_color
  end
end
