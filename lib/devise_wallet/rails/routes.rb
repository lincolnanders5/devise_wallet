module ActionDispatch::Routing
  class Mapper
    protected
      def devise_wallet_authentication(mapping, controllers) #:nodoc:

        resources :wallet_authentication,
                  :only => [:new, :create, :show],
                  :controller => controllers[:wallet_authentication],
                  :module => controllers[:wallet_authentication] ? nil : 'devise'
      end
  end
end

