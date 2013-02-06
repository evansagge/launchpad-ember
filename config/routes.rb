Launchpad::Application.routes.draw do
  class FormatTest
    attr_accessor :mime_type

    def initialize(format)
      @mime_type = Mime::Type.lookup_by_extension(format)
    end

    def matches?(request)
      request.format == mime_type
    end
  end

  devise_for :users, path: "admin/users", controllers: { sessions: "admin/sessions" },
    path_names: { sign_in: "login", sign_out: "logout" }  

  namespace :admin do
    authenticate :user do
      resource :profile
      resources :articles
      resources :uploads
      resources :pages
    end

    authenticated :user do
      root to: "dashboard#index"
    end

    unauthenticated do
      as :user do
        root to: "sessions#new"
      end
    end
  end  

  resources :articles, only: [:index, :show], constraints: FormatTest.new(:json)
  resources :pages, only: :show, constraints: FormatTest.new(:json)
  get '*foo', to: 'home#index', constraints: FormatTest.new(:html)
  get '/', to: 'home#index', constraints: FormatTest.new(:html)
end
