Rails.application.routes.draw do
  root 'polin#index'

  get 'polin/index'

  get 'polin/view'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
