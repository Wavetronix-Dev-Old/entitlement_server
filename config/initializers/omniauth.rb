Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity,
            fields: [:first_name, :last_name, :email, :company, :job_title],
            on_failed_registration: lambda { |env|
              IdentitiesController.action(:new).call(env)
            }
end
