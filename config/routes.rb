Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root 'questions#index'

  resources :questions do
    member do
      get :vote_up
      get :vote_down
    end
    resources :answers, only: [:edit, :create, :update, :destroy] do
      member do
        get :vote_up
        get :vote_down
      end
    end
  end

  resources :users, only: [:index, :show] do
    resources :questions, only: [:index, :show]
  end

  resources :questions, only: [:index, :show] do
    resources :likes, only: [:create, :destroy]
  end

  resources :tags, only: [:index]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
