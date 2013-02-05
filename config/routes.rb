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

  resources :articles, only: [:index, :show], constraints: FormatTest.new(:json)
  resources :pages, only: :show, constraints: FormatTest.new(:json)
  get '*foo', to: 'home#index', constraints: FormatTest.new(:html)
  get '/', to: 'home#index', constraints: FormatTest.new(:html)
end
