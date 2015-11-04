OmniAuth.config.test_mode = true

identity_hash = {
  provider: "identity",
  uid: "9372",
  info: {
    first_name: "Bob",
    last_name: "Billy",
    email: "bibblybob@bob.com"
  }
}

OmniAuth.config.add_mock(:identity, identity_hash)
