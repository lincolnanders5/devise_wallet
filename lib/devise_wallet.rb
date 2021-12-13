# frozen_string_literal: true

require 'devise'
require_relative 'devise_wallet/version'
require_relative 'devise_wallet/rails'
require_relative 'devise_wallet/rails/routes'
require_relative 'devise_wallet/controllers/internal_helpers'

Devise.add_module :wallet_authable,
                  model: 'devise_wallet/models/wallet_authable',
                  controller: 'wallet_authentications',
                  route: { wallet_authentication: [ nil, :new ] }

module DeviseWallet
  mattr_accessor :wallet_authentication_class
  @@wallet_authentication_class = "Devise::WalletAuthentication"

  class Error < StandardError; end
end

