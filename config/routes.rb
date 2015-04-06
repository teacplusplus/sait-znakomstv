SaitZnakomstv::Application.routes.draw do


  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root :to => 'topic_rubrics#index'
  resources :topic_rubrics
  get 'articles/:id' => 'topics#show#id', :as => 'topic'

  namespace :api do
    resources :cities
  end


end
