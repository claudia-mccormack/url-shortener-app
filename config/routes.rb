Rails.application.routes.draw do
  get '/links' => 'links#index'
  get '/links/new' => 'links#new'
  post '/links/:id' => 'links#create'
  get '/links/:id' => 'links#show'
  get '/links/:id/edit' => 'links#edit'
  patch '/links/:id' => 'links#update'
  delete '/links/:id' => 'links#destroy'



  devise_for :users
  devise_scope :user do
   authenticated :user do
     root 'links#index', as: :authenticated_root
   end

   unauthenticated do
     root 'devise/registrations#new', as: :unauthenticated_root
   end
 end

end
