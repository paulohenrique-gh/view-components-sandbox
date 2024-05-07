## This application doesn't have funcionalities and its only purpose is to experiment with the view_component gem

Add `view_component` to `Gemfile`:
```ruby
gem 'view_component'
```
---

Generate new component:
```shell
rails generate component HelloWorld arg1 arg2
```

This will generate the following files in the `app/components` directory:

- `hello_world_component.rb`: A file for the Ruby class that encapsulates the component logic
- `hello_world_component.html.erb`: The template file for the component HTML
- `hello_world_component_test.rb`: The test file for the component
