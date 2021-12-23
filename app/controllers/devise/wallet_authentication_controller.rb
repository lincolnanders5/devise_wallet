require 'securerandom'

class Devise::WalletAuthenticationController < ApplicationController
  include Devise::Controllers::Helpers
  include DeviseWallet::Controllers::InternalHelpers

  # GET /resource/wallet_authentications/new
  def new
    session[:wallet_nonce] ||= SecureRandom.hex(10) + SecureRandom.hex(10) + SecureRandom.hex(10)
    @nonce = session[:wallet_nonce]
    @devise_wallet_app_name = ENV.fetch("DEVISE_WALLET_APP_NAME") { "TODO: Set DEVISE_WALLET_APP_NAME" }
  end

  # POST /resource/wallet_authentications
  def create
    create_and_redirect_to_resource params
  end

  # GET /resource/wallet_authentications/:id
  def show
    @wallet_authentication = wallet_authentication_class.find_by_id(
      session[:wallet_authentication_id]
    )
    if @wallet_authentication
      if @wallet_authentication.token
        if @wallet_authentication.has_token_param?(params)
          if @wallet_authentication.token_param_valid?
            @wallet_authentication.get_authentication_details!
          else
            @wallet_authentication.destroy
            url = new_wallet_authentication_path(resource_name)
          end
        else
          url = @wallet_authentication.remote_url
        end
      end
    else
       set_flash_message(
         :error,
         :something_went_wrong_when_contacting_wallet
       ) if session[:wallet_authentication_id]
      url = new_wallet_authentication_path(resource_name)
    end
    redirect_to url if url
  end

  private
    def create_and_redirect_to_resource(params)
      wallet_authentication = wallet_authentication_class.create!(
        :params => params
      )
      session[:wallet_authentication_id] = wallet_authentication.id
      wallet_authentication.callback_url = wallet_authentication_url(
        resource_name, wallet_authentication
      )
      wallet_authentication.get_authentication_token!
      redirect_to wallet_authentication_path(
        resource_name, wallet_authentication
      )
    end
end

