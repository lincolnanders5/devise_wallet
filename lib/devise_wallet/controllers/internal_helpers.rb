module DeviseWallet
  module Controllers
    module InternalHelpers

      private

      def wallet_authentication_class
        resource_class.wallet_authentication_class.constantize
      end

      def handle_callback_action(resource_params, request_params)
        isOne = resource_class.method(:find_for_wallet_auth).arity == 1
        self.resource = isOne ? resource_class.find_for_wallet_auth(resource_params) : resource_class.find_for_wallet_auth(resource_params, request_params)
        if resource.persisted? && resource.errors.empty?
          set_wallet_flash_message :notice, :success, :resource => resource
          sign_in_and_redirect resource_name, resource, :event => :authentication
        else
          set_wallet_flash_message :notice, :failure, :resource => resource
          clean_up_passwords(resource)
          render_for_wallet
        end
      end

      # Handles wallet flash messages by adding a cascade. The default messages
      # are always in the controller namespace:
      #
      #   en:
      #     devise:
      #       wallet_authable:
      #         success: 'Successfully authorized from your wallet.'
      #         failure: 'Unable to authorize you from your wallet.'
      #
      #       wallet_permissions_authable:
      #         success: 'Successfully authorized from your wallet.'
      #         failure: 'Unable to authorize you from your wallet.'
      #
      # But they can also be nested by Devise scope:
      #
      #   en:
      #     devise:
      #       wallet_authable:
      #         admin:
      #           sucess: 'Hello admin! You're successfully authorized from your wallet.'
      #           failure: 'Sorry admin. Unable to authorize you from your wallet.'
      #       wallet_permissions_authable:
      #         admin:
      #           success: 'Hello admin! You're successfully authorized from your wallet.'
      #           failure: 'Sorry admin. Unable to authorize you from your wallet.'
      #
      # If you customize your controllers by inheriting
      # Devise::WalletPermissionsAuthable or Devise::WalletAuthable
      # don't forget to change your translation key from
      # 'wallet_permissions_authable' => 'your wallet permissions controller' and
      # 'wallet_authable' => 'your wallet authable controller'
      #
      def set_wallet_flash_message(key, type, options={})
        set_flash_message(key, type, options)
      end

      # Choose which template to render when a not persisted resource is
      # returned in the find_for_wallet_auth.
      # By default, it renders registrations/new.
      def render_for_wallet
        render_with_scope :new, devise_mapping.controllers[:registrations]
      end
    end
  end
end
