# DeviseWallet

A gem for identifying users based on wallet identification. Prompts user for authorization to use wallet, then an [`ssh-keygen`-style message][ssh-art] is signed by the wallet.
Nonce-based authentication based on ideas from [Amaury Martiny's "One-click Login with Blockchain: A MetaMask Tutorial"][metamask-login], implemented with [ethers.js][ethers-js].

This gem idea is still being developed, *do not use*. Here be dragons.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'devise_wallet'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install devise_wallet

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lincolnanders5/devise_wallet. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/lincolnaners5/devise_wallet/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

[ethers-js]:https://docs.ethers.io/v5/
[metamask-login]: https://www.toptal.com/ethereum/one-click-login-flows-a-metamask-tutorial
[ssh-art]: https://blog.benjojo.co.uk/post/ssh-randomart-how-does-it-work-art 
