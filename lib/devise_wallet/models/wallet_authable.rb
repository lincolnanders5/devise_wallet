module Devise::Models::WalletAuthable
  extend ActiveSupport::Concern

  module ClassMethods
     Devise::Models.config(self, :wallet_authentication_class)
  end
end

