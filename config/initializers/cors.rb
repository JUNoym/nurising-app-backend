Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
      origins 'http://localhost:8080'

      resource '*',
          headers: :any,
          methods: [:get, :post, :put, :patch, :delete, :options, :head],
          credentials: true
  end

  allow do
    origins 'https://nursing-app-frontend.vercel.app', 'https://nursing-app-frontend3.vercel.app'

    resource '*',
        headers: :any,
        methods: [:get, :post, :put, :patch, :delete, :options, :head],
        credentials: true
end
end