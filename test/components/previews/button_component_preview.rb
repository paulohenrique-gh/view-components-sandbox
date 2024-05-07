class ButtonComponentPreview < Lookbook::Preview
  def default
    render GeneralComponents::ButtonComponent.new(text: 'Click here', disabled: false)
  end

  def disabled
    render GeneralComponents::ButtonComponent.new(text: 'Don\'t click here!', disabled: true)
  end

  # @param text "Example text"
  # @param disabled toggle "Toggle disabled"
  def dynamic_example(text: 'Example button text', disabled: false)
    render GeneralComponents::ButtonComponent.new(text: text, disabled: disabled)
  end
end
