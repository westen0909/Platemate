Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users, :controllers => { registrations: 'registrations' }  
	resources :posts do
		resources :comments 
	end
	
	patch ':user_name/edit', to: 'profiles#update', as: :update_profile  
	get ':user_name/edit', to: 'profiles#edit', as: :edit_profile 
	get ':user_name', to: 'profiles#show', as: :profile  
	root 'posts#index'
end
