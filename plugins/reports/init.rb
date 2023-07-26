Redmine::Plugin.register :reports do
  name 'Reports plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
  menu :application_menu, :reports, { :controller => 'reports', :action => 'index' }, :caption => 'Reports'

end