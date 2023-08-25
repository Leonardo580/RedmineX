# Create new plugin

You may need to set the RAILS_ENV variable in order to use the command below:
```
export RAILS_ENV="production"
```
Creating a new plugin can be done using the Redmine plugin generator.
```
bundle exec rails generate redmine_plugin <plugin_name>
```
Edit plugins/my_plugin/init.rb to adjust plugin information (name, author, description and version):
```
Redmine::Plugin.register :my_plugin do
  name 'my_plugin plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
```
Then restart the application, then browse to /admin/plugins. you should see your new plugin in the plugin list 
## Generating a model
```
bundle exec rails generate redmine_plugin_model <plugin_name> <model_name> [field[:type][:index] field[:type][:index] ...]
```
example: 
```
bundle exec rails generate redmine_plugin_model polls poll question:string yes:integer no:integer

```
## Generating a controller
```
bundle exec rails generate redmine_plugin_controller <plugin_name> <controller_name> [<actions>]
```

example: 
```
bundle exec rails generate redmine_plugin_controller Polls polls index vote

```

## Adding routes 

Redmine does not provide the default wildcard route (':controller/:action/:id'). Plugins have to declare the routes they need in their proper config/routes.rb file. So edit plugins/polls/config/routes.rb to add the 2 routes for the 2 actions:
```
get 'polls', to: 'polls#index'
post 'post/:id/vote', to: 'polls#vote'
```

## Extending application menu 
Edit plugins/polls/init.rb at the root of your plugin directory to add the following line at the end of the plugin registration block:

```
Redmine::Plugin.register :redmine_polls do

  menu :application_menu, :polls, { controller: 'polls', action: 'index' }, caption: 'Polls'
end
```