Rails.application.routes.draw do
  root 'madlibs#index'
  resources :madlibs, only: %i[new create show] do
    post 'generate', to: "madlibs#generate"
  end
end
