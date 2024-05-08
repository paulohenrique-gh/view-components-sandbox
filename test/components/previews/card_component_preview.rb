class CardComponentPreview < Lookbook::Preview
  def default
    render GeneralComponents::CardComponent.new(img_url: 'https://placehold.co/400x200.png') do |component|
      component.with_header do 
        <<~ERB.html_safe
          Card title
        ERB
      end

      component.with_body do
        <<~ERB.html_safe
          Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.
        ERB
      end

      component.with_button(text: 'Button 1', disabled: false)
      component.with_button(text: 'Button 2', disabled: true)
    end
  end

  def no_image
    render GeneralComponents::CardComponent.new do |component|
      component.with_header do
        <<~ERB.html_safe
          <h1>Title with h1</h1>
        ERB
      end

      component.with_body do
        <<~ERB.html_safe
          <p>This is a body with a single sentence</p>
        ERB
      end
    end
  end

  # @param img_url "The URL of the image to be displayed"
  # @param header "The card header"
  # @param body "The main content of the card"
  # @param button_text "The text do display on the button"
  # @param button_disabled toggle "Disable the button"
  def dynamic_example(img_url: nil, header: '', body: '', number_of_buttons: 1, button_text: '', button_disabled: false)
    render GeneralComponents::CardComponent.new(img_url: img_url) do |component|
      component.with_header do
        <<~ERB.html_safe
          #{header}
        ERB
      end

      component.with_body do
        <<~ERB.html_safe
          #{body}
        ERB
      end

      if button_text.present?
        component.with_button(text: button_text, disabled: button_disabled)
      end
    end
  end
end
