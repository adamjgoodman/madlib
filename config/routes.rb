Rails.application.routes.draw do
  root 'madlibs#index'
  resources :madlibs do
    post 'generate', to: "madlibs#generate"
  end
end
