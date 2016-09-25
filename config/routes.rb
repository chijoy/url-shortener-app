Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'links#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/registrations#new', as: :unauthenticated_root
    end
  end

  get '/' => 'links#index'
  get '/links/new' => 'links#new'
  post '/links' => 'links#create'

  get '/' => 'visits#index'
  get '/visits/new' => 'visits#new'
  post '/visits' => 'visits#create'

  get '/visits/:id' => 'visits#show'

  get '/links/:id/edit' => 'links#edit'
  patch '/links/:id' => 'links#update'

  delete '/links/:id' => 'links#destroy'

end
