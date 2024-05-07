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

