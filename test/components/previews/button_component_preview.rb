class ButtonComponentPreview < Lookbook::Preview
  def default
    render GeneralComponents::ButtonComponent.new(text: 'Click here', disabled: false)
  end

  def disabled
    render GeneralComponents::ButtonComponent.new(text: 'Don\'t click here!', disabled: true)
  end
end
