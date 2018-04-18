OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '728876964467-6aq2vk7d0o9ea2b87d39tnsg3eg6bhp5.apps.googleusercontent.com', 'HyfnX1Wo41BddaTyrv5JHuAi', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
