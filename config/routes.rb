Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/doctors/:id', to: 'doctors#show'

  resources :doctors, only: :show do 
    resources :patients, only: :destroy, controller: :doctor_patients
  end
end