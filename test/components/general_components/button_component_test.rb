# frozen_string_literal: true

require "test_helper"

class GeneralComponents::ButtonComponentTest < ViewComponent::TestCase
  def test_renders_button_with_correct_text
    render_inline(GeneralComponents::ButtonComponent.new(text: 'Activate', disabled: false))
    
    assert_selector 'button', text: 'Activate'
  end

  def test_renders_disabled_button
    render_inline(GeneralComponents::ButtonComponent.new(text: 'Activate', disabled: true))
    
    assert_selector 'button[disabled]'
  end
end
