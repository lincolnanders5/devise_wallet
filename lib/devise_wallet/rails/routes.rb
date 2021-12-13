module ActionDispatch::Routing
  class Mapper
    protected
      def devise_wallet_authentication(mapping, controllers) #:nodoc:

        resources :wallet_authentications,
                  :only => [:new, :create, :show],
                  :controller => controllers[:wallet_authable],
                  :module => controllers[:wallet_authable] ? nil : 'devise'
      end
  end
end

