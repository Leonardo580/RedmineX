# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
resources :contracts

get 'contracts/new/:project_id', to: 'contracts#new'
get 'contracts/index', to: 'contracts#index'
get 'contracts/:project_id', to: 'contracts#edit'
post 'contracts/:project_id', to: 'contracts#update'
delete 'contracts/:project_id', to: 'contracts#destroy'

resources :rlogs
get 'rlogs', to: 'rlogs#index'