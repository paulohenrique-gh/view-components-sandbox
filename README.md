### This application doesn't have funcionalities and its only purpose is to experiment with the view_component gem

## ViewComponent

Add `view_component` to `Gemfile`:
```ruby
gem 'view_component'
```
---

Generate new component. The parameters are optional as you can define them in the component file:
```shell
rails generate component HelloWorld arg1 arg2
```

This will generate the following files in the `app/components` directory:

- `hello_world_component.rb`: A file for the Ruby class that encapsulates the component logic
- `hello_world_component.html.erb`: The template file for the component HTML
- `hello_world_component_test.rb`: The test file for the component

---

Generators:

- Namespaced components:
```shell
rails generate component BaseComponents::Button
```

- Change test framework:
```shell
rails generate component Form --test-framework rspec
```

- Generate component with preview:
```shell
rails generate component Form --preview
```

- More generators: https://viewcomponent.org/guide/generators.html

---

## Lookbook

Link to documentation: https://v2.lookbook.build/

Lookbook is a UI tool that allows developers to preview components in isolation.

You can add the gem `listen` for live updates in the browser:

```ruby
gem "listen"
```

```shell
bundle install
```

The route for Lookbook should be added to `config/routes.rb`:

```ruby
if Rails.env.development?
  mount Lookbook::Engine, at: "/lookbook"
end
```
And then you can access the previews here: http://localhost:3000/lookbook


The preview files are located in `test/components/previews`.

You can make dynamic previews for the component in the browser:

```ruby
class ButtonComponentPreview < Lookbook::Preview
  # @param text "Example text"
  # @param disabled toggle "Toggle disabled"
  def dynamic_example(text: 'Example button text', disabled: false)
      render GeneralComponents::ButtonComponent.new(text: text, disabled: disabled)
  end
end
```
---
## Slots

Link to documentation: https://viewcomponent.org/guide/slots.html

Example:
```ruby
# card_component.rb
class GeneralComponents::CardComponent < ViewComponent::Base
  renders_one :header
  renders_one :body
  renders_many :buttons, GeneralComponents::ButtonComponent

  def initialize(img_url: nil)
    @img_url = img_url
  end
end

# card_component.html.erb
<div>
  <% if @img_url.present? %>
    <div>
      <img src="<%= @img_url %>">
    </div>
  <% end %>

  <% if header? %>
    <h2>
      <%= header %>
    </h2>
  <% end %>

  <% if body? %>
    <div>
      <%= body %>
    </div>
  <% end %>

  <% buttons.each do |button| %>
    <%= button %>
  <% end %>
</div>

# index.html.erb
<%= render GeneralComponents::CardComponent.new(img_url: 'https://placehold.co/600x400.png') do |component| %>
  <% component.with_header do %>
    <h2>Card Title</h2>
  <% end %>

  <%= component.with_body do %>
    <div>
      <p>Lorem ipsum dolor sit amet, qui minim labore adipisicing minim sint cillum sint consectetur cupidatat.</p>
      <p>Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.</p>
    </div>
  <% end %>

  <%=
      component.with_buttons(
      [
        { text: 'Button 1', disabled: false },
        { text: 'Button 2', disabled: false },
        { text: 'Button 3', disabled: true }
      ]
    )
  %>
```

---
## Rendering collections

Link to documentation: https://viewcomponent.org/guide/collections.html

User `with_collection_parameter` do set the name of the collection parameter

```ruby
# product_component.rb
class ProductComponent < ViewComponent::Base
  with_collection_parameter :product

  def initialize(product:)
    @title = product[:title]
    @description = product[:description]
  end
end

# product_component.html.erb
<li>
  <strong><%= @title %>:</strong>
  <br>
  <%= @description %>
</li>

# product_component_preview.rb
def collection
products = [
  { title: 'Product 1', description: 'Description 1'},
  { title: 'Product 2', description: 'Description 2'},
  { title: 'Product 3', description: 'Description 3'}
]

render ProductComponent.with_collection(products)
end
```

---
## General notes
The blocked passed to a new component instance can be accessed in the template by calling the `content` method

Reference: https://viewcomponent.org/guide/getting-started.html

Example:

```ruby
# home/index.html.erb
<%= render ProductComponent.new(name: 'My Product') do %>
    This is the description of the product
<% end %>

# or
<%= render ProductComponent.new(name: 'My Product').with_content('This is the description of the product') %>

# components/product_component.html.erb
<div>
    <%= @name %>
    
    <p><%= content %></p>
</div>
```

