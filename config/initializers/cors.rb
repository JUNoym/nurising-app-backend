# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins 'http://localhost:8080'
    origins '*'
    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end

  # 本番環境
  # allow do
    # origins 'https://nursing-app-frontend3.vercel.app/'
    #  origins '*'

    # resource '*',
        # headers: :any,
        # methods: [:get, :post, :put, :patch, :delete, :options, :head],
        # credentials: true
  # end
end
