Rails.application.routes.draw do
  root 'factorial#input'  

  get 'factorial/input'

  get 'factorial/view'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
