Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :contacts
      resources :phones

      # Add Phone Number
      post 'contacts/:contact_id/phone', to: 'phones#create'

    end
  end

end