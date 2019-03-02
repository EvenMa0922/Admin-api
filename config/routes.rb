Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :packages, only: %i(create update destroy index)
      resources :sections, only: %i(show)
    end
  end
end
